class StocksController < ApplicationController
    def index # order(name: :asc)で名前順に表示させるようにしたい
        @stock = current_user.stocks.order(name: :asc)
        respond_to do |format|
          format.html
          format.csv do
            send_data render_to_string,filename:"stocks.csv",type: :csv
          end
        end
    end
    
    # 器の準備
    def new
        @stock = Stock.new
    end

    # 器にパラメータを注ぐ
    def create
        @stock = current_user.stocks.new(stock_params)
        @stock.expire_date = Date.parse(stock_params[:expire_date])
        if @stock.save
          redirect_to stocks_path, notice: "「#{@stock.name}」を新規登録しました！"
        else render :new
        end
    end

    def show
    end

    def edit
        @stock = Stock.find(params[:id])
    end

    def update
        @stock = Stock.find(params[:id])
        if @stock.update_attributes(stock_params)
            redirect_to stocks_path, notice: "「#{@stock.name}」が更新されました！"
        else render :edit
        end
    end

    def destroy
      @stock = Stock.find(params[:id])
      @stock.destroy
      redirect_to stocks_path, notice: "「#{@stock.name}」が削除されました！"
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:unit,:stock,:expire_date,:memo)
    end
end
