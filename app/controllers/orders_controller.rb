class OrdersController < ApplicationController
    
    def index
        @orders = Order.where(shop_id: current_shop.id)
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
            flash[:notice] = "保存しました"
            redirect_to request.referer
        else
            # urlをitemsのindexに戻したいのでエラーメッセージをフラッシュで出す
            flash[:notice] = "０個じゃ発注できないよ"
            redirect_to request.referer
        end
        
    end
    # 日付か商品名かで入れるデータを変える
    def show
        if params[:created_at]
            @orders = Order.where(shop_id: current_shop.id, created_at: params[:created_at].in_time_zone.all_month)
        else
            @orders = Order.where(shop_id: current_shop.id, name: params[:name])
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
