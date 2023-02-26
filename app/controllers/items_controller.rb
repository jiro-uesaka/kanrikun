class ItemsController < ApplicationController
    
    def index
        @item = Item.new
        make_data
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:notice] = "更新しました"
            redirect_to request.referer
        else
            make_data
            render :index
        end
        
    end
    
    def destroy
        item = Item.find(params[:id])
        if item.destroy
          flash[:notice] = "削除しました"
        end
        redirect_to request.referer
    end
    
    def create
        @item = Item.new(item_params)
        @item.shop_id = current_shop.id
        if @item.save
            flash[:notice] = "新規登録しました"
            redirect_to request.referer
        else
            make_data
            render :index
        end
        
    end
    
    private
    
    def make_data
        @items = Item.where(shop_id: current_shop.id).page(params[:items]).per(6)
        @order = Order.new
        @orders = Order.where(shop_id: current_shop.id, status: "in_order").page(params[:orders]).per(20)
    end
  
    def item_params
        params.require(:item).permit(:name, :price, :status, :stock, :order)
    end
end
