class PatternsController < ApplicationController
    
    def index
        @pattern = Pattern.new
        @patterns = Pattern.where(shop_id: current_shop.id).page(params[:page])
    end
    
    def update
        @pattern = Pattern.find(params[:id])
        if @pattern.update(pattern_params)
            flash[:notice] = "更新しました"
            redirect_to request.referer
        else
            @patterns = Pattern.where(shop_id: current_shop.id).page(params[:page])
            render :index
        end
        
    end
    
    def destroy
        pattern = Pattern.find(params[:id])
        pattern.destroy
        flash[:notice] = "削除しました"
        redirect_to request.referer
    end
    
    def create
        @pattern = Pattern.new(pattern_params)
        @pattern.shop_id = current_shop.id
        if @pattern.save
            flash[:notice] = "新規登録しました"
            redirect_to request.referer
        else
            @patterns = Pattern.where(shop_id: current_shop.id).page(params[:page])
            render :index
        end
        
    end
    
    private
      
    def pattern_params
        params.require(:pattern).permit(:name, :start_time, :end_time, :rest_time, :status)
    end
    
end
