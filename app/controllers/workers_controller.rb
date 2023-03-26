class WorkersController < ApplicationController
    
    def index
        @worker = Worker.new
        @workers = Worker.where(shop_id: current_shop.id).page(params[:page])
    end
    
    def update
        @worker = Worker.find(params[:id])
        if @worker.update(worker_params)
            flash[:notice] = "更新しました"
            redirect_to request.referer
        else
            @workers = Worker.where(shop_id: current_shop.id).page(params[:page])
            render :index
        end
        
    end
    
    def destroy
        worker = Worker.find(params[:id])
        worker.destroy
        flash[:notice] = "削除しました"
        redirect_to request.referer
    end
    
    def create
        @worker = Worker.new(worker_params)
        @worker.shop_id = current_shop.id
        if @worker.save
            flash[:notice] = "新規登録しました"
            redirect_to request.referer
        else
            @workers = Worker.where(shop_id: current_shop.id).page(params[:page])
            render :index
        end
        
    end
    
    private
  
    def worker_params
        params.require(:worker).permit(:name)
    end
  
end
