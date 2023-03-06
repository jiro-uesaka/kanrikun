class ItemsController < ApplicationController
    
    def index
        @item = Item.new
        make_data
    end
    
    def search
        @order = Order.new
        if params[:tag]
            @items = Item.joins(:tags).where(shop_id: current_shop.id, tags:{name: params[:tag]})   
        else
            @items = Item.where(shop_id: current_shop.id).where( "name LIKE ?" , "%#{params[:input_name]}%")
        end
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            if @item.status == "product"
                tag = @item.tags.find_by(name: "Equipment")
                if tag.present?
                    tag.update(name: "Product")
                end
            else
                tag = @item.tags.find_by(name: "Product")
                if tag.present?
                    tag.update(name: "Equipment")
                end
            end
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
            if @item.status == "product"
                @item.tags.create(name: "Product")
            else
                @item.tags.create(name: "Equipment")
            end
            if @item.image.attached?
                tags = Vision.get_image_data(@item.image)    
                tags.each do |tag|
                  @item.tags.create(name: tag)
                end
            end
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
        params.require(:item).permit(:name, :price, :status, :stock, :image)
    end
end
