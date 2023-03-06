class OrdersController < ApplicationController
    
    def index
        @orders = Order.where(shop_id: current_shop.id)
        # 発注月で検索用
        orders_all = Order.where(shop_id: current_shop.id).pluck(:created_at)
        orders_array = []
        orders_all.each do |order|
            if order.month < 10
                orders_array << (order.year.to_s + "-0" + order.month.to_s)  
            else
                orders_array << (order.year.to_s + "-" + order.month.to_s) 
            end
        end  
        @search = orders_array.uniq.sort.reverse
    end
    
    def create
        order = Order.new(order_params)
        if order.amount.present?
            order.shop_id = current_shop.id
            item = Item.find(params[:item_id])
            order.item_id = item.id
            order.name = item.name
            order.status = "in_order"
            order.total_price = (item.price * order.amount)
            order.save
            flash[:notice] = "発注しました"
            redirect_to items_path
        else
            # urlをitemsのindexに戻したいのでエラーメッセージをフラッシュで出す
            flash[:notice] = "発注する個数を入力してください"
            redirect_to items_path
        end
        
    end
    # 日付か商品名か納品済みかで入れるデータを変える
    def show
        if params[:created_at]
            # 検索ボックスから日付を選択した場合
            if params[:created_at].length < 8
                day = params[:created_at] + "-01"
            # 日付を直接クリックした場合
            else
                day = params[:created_at]
            end
            @orders = Order.where(shop_id: current_shop.id, created_at: day.in_time_zone.all_month)
            @title = "#{day.to_date.year}年" + "#{day.to_date.month}月" 
        elsif params[:status]
            @orders = Order.where(shop_id: current_shop.id, status: params[:status])
            if params[:status] == "in_order"
                @title = "発注中"
            else
                @title = "納品済み"
            end
        else
            @orders = Order.where(shop_id: current_shop.id, name: params[:name])
            @title = params[:name]
        end
    end
    # 納品か取り消しのみなのでstatus以外は変更しない
    # 該当商品が削除されていたら納品はできないので必ずstockは増える
    def update
        order = Order.find(params[:id])
        order.update(status: "out_order")
        item = Item.find_by(id: order.item_id)
        item.stock += order.amount
        item.save
        flash[:notice] = "更新しました"
        redirect_to request.referer
    end
    
    def destroy
        order = Order.find(params[:id])
        order.destroy
        flash[:notice] = "削除しました"
        redirect_to request.referer
    end
    
    private
  
    def order_params
        params.require(:order).permit(:amount)
    end
end
