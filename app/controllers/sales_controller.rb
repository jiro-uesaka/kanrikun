class SalesController < ApplicationController
    
    # インデックスページではグラフは年間の売上を表示
    def index
        reference_date = Date.current
        @sale = Sale.new
        @year_proceed = Sale.where(shop_id: current_shop.id, created_at: reference_date.prev_month.in_time_zone.all_year)
        make_search_data(reference_date)
    end
    
    # showページではグラフは月ごとの売上を表示
    def show
        reference_date = (params[:created_at] + "-01").to_date
        make_search_data(reference_date)
    end
    
    
    def edit
        @sale = Sale.new
        search_date = Sale.find(params[:id]).created_at
        @sales = Sale.where(shop_id: current_shop.id, created_at: search_date.in_time_zone.all_month)
    end
    
    def create
        @sale = Sale.new(sale_params)
        @sale.shop_id = current_shop.id
        if @sale.save
            flash[:notice] = "保存しました"
            redirect_to request.referer
        else
            reference_date = Date.current
            @year_proceed = Sale.where(shop_id: current_shop.id, created_at: reference_date.prev_month.in_time_zone.all_year)
            make_search_data(reference_date)
            render :index
        end
        
    end
    
    def destroy
        sale = Sale.find(params[:id])
        sales = Sale.where(shop_id: current_shop.id, created_at: sale.created_at.in_time_zone.all_month)
        if sale.destroy
          flash[:notice] = "削除しました"
        end
        # 該当月の売上データが１つもない場合はindexに戻す
        if sales.present?
            redirect_to edit_sale_path(sales.first.id)
        else
            redirect_to sales_path
        end
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
    
    private
    
    # 該当月から当月の売上と前月の売上、何月のデータが存在するかを出す
    def make_search_data(day)
        @sales = Sale.where(shop_id: current_shop.id, created_at: day.in_time_zone.all_month)
        @previous_proceed = Sale.where(shop_id: current_shop.id, created_at: day.prev_month.in_time_zone.all_month).sum(:proceed)
        # 該当月に一件でも売上の登録があればその月を表示できるようにする
        sales_all = Sale.where(shop_id: current_shop.id).pluck(:created_at)
        sales_array = []
        sales_all.each do |sale|
            if sale.month < 10
                sales_array << (sale.year.to_s + "-0" + sale.month.to_s)  
            else
                sales_array << (sale.year.to_s + "-" + sale.month.to_s) 
            end
        end  
        @search = sales_array.uniq.sort
    end
    
    def sale_params
        params.require(:sale).permit(:created_at, :proceed)
    end
    
end
