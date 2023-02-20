class SalesController < ApplicationController
    
    def new
        today_date = Date.current
        @sale = Sale.new
        @sales = Sale.where(shop_id: current_shop.id, created_at: today_date.in_time_zone.all_month)
        @previous_proceed = Sale.where(shop_id: current_shop.id, created_at: today_date.prev_month.in_time_zone.all_month).sum(:proceed)
        @year_proceed = Sale.where(shop_id: current_shop.id, created_at: today_date.prev_month.in_time_zone.all_year)
        sales_all = Sale.where(shop_id: current_shop.id).pluck(:created_at)
        sales_array = []
        sales_all.each do |sale|
            sales_array << (sale.year.to_s + "-" + sale.month.to_s)  
        end  
        @search = sales_array.uniq.sort
    end
    
    def index
        search_date = (params[:created_at] + "-01").to_date  
        @sales = Sale.where(created_at: search_date.in_time_zone.all_month)
        @previous_proceed = Sale.where(shop_id: current_shop.id, created_at: search_date.prev_month.in_time_zone.all_month).sum(:proceed)
        sales_all = Sale.where(shop_id: current_shop.id).pluck(:created_at)
        sales_array = []
        sales_all.each do |sale|
            sales_array << (sale.year.to_s + "-" + sale.month.to_s)  
        end  
        @search = sales_array.uniq.sort
    end
    
    
    def edit
        @sale = Sale.new
        search_date = Sale.find(params[:id]).created_at
        @sales = Sale.where(created_at: search_date.in_time_zone.all_month)
    end
    
    def create
        @sale = Sale.new(sale_params)
        @sale.shop_id = current_shop.id
        if @sale.save
            flash[:notice] = "保存しました"
            redirect_to request.referer
        else
            today_date = Date.current
            @sales = Sale.where(shop_id: current_shop.id, created_at: today_date.in_time_zone.all_month)
            @previous_proceed = Sale.where(shop_id: current_shop.id, created_at: today_date.prev_month.in_time_zone.all_month).sum(:proceed)
            @year_proceed = Sale.where(shop_id: current_shop.id, created_at: today_date.prev_month.in_time_zone.all_year).sum(:proceed)
            render :new
        end
        
    end
    
    def destroy
        sale = Sale.find(params[:id])
        if sale.destroy
          flash[:notice] = "削除しました"
        end
        redirect_to request.referer
    end
    
    def update
        @sale = Sale.find(params[:id])
        if @sale.update(sale_params)
            flash[:notice] = "更新しました"
            redirect_to request.referer
        else
            search_date = Sale.find(params[:id]).created_at
            @sales = Sale.where(created_at: search_date.in_time_zone.all_month)
            render :edit
        end
        
    end
    
    def sale_params
        params.require(:sale).permit(:created_at, :proceed)
    end
    
end
