class ItemsController < ApplicationController
    
    def index
        @item = Item.new
        @items = Item.where(shop_id: current_shop.id)
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:notice] = "更新しました"
            redirect_to request.referer
        else
            @items = Item.where(shop_id: current_shop.id)
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
            @items = Item.where(shop_id: current_shop.id)
            render :index
        end
        
    end
    
    private
  
  def item_params
    params.require(:item).permit(:name, :price, :status, :stock, :order)
  end
end
