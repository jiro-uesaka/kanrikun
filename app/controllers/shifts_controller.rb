class ShiftsController < ApplicationController
    
    def index
        search_datum
        @shift = Shift.new
    end
    
    def preview
        search_datum
        # 印刷用画面なのでヘッダーを非表示にする
        render layout: "preview"
    end
    
    def update
        @shift = Shift.find(params[:id])
        # 一括登録の場合
        if params[:all]
            day = 1
            while day <= 31
                @shift.send("day#{day}=", params[:shift][:all_pattern])
                day += 1
            end
            if @shift.save
                flash[:notice] = "更新しました"
                redirect_to request.referer
            else
                search_datum
                render :index
            end
        # 個別登録の場合
        else
            if @shift.update(shift_params)
                flash[:notice] = "更新しました"
                redirect_to request.referer
            else
                search_datum
                render :index
            end
        end
    end
    
    def edit
        @shift = Shift.find(params[:id])
        search_datum
    end
    
    def destroy
        shift = Shift.find(params[:id])
        shift.destroy
        flash[:notice] = "削除しました"
        redirect_to request.referer
    end
    
    def destroy_all
        shifts = Shift.where(shop_id: current_shop.id)
        shifts.destroy_all
        flash[:notice] = "全て削除しました"
        redirect_to request.referer
    end
    
    def create
        @shift = Shift.new(shift_params)
        @shift.shop_id = current_shop.id
        # 一括登録の場合
        if params[:all]
            day = 1
            while day <= 31
                @shift.send("day#{day}=", params[:shift][:all_pattern])
                day += 1
            end
            if @shift.save
                flash[:notice] = "新規登録しました"
                redirect_to request.referer
            else
                search_datum
                render :index
            end
        # 個別登録の場合
        else
            if @shift.save
                flash[:notice] = "新規登録しました"
                redirect_to request.referer
            else
                search_datum
                render :index
            end
        end
    end
    
    private
    
    def search_datum
        @patterns = Pattern.where(shop_id: current_shop.id)
        @workers = Worker.where(shop_id: current_shop.id)
        @shifts = Shift.where(shop_id: current_shop.id)
    end
  
    def shift_params
        params.require(:shift).permit(:worker_id, :day1, :day2, :day3, :day4, :day5, :day6, :day7, :day8, :day9, :day10, :day11, :day12, :day13, :day14, :day15,
                                        :day16, :day17, :day18, :day19, :day20, :day21, :day22, :day23, :day24, :day25, :day26, :day27, :day28, :day29, :day30, :day31)
    end
end
