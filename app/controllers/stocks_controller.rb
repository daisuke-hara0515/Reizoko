class StocksController < ApplicationController
    def index
        @stock = Stock.all
    end
    
    # 器の準備
    def new
        @stock = Stock.new
    end

    # 器にパラメータを注ぐ
    def create
        @stock = current_user.stocks.new(stock_params)
        
        if @stock.save
          redirect_to @stock, notice: "「#{@stock.name}」を新規登録しました！"
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
            redirect_to root_path, notice: "「#{@stock.name}」が更新されました！"
        else render :edit
        end
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:unit,:stock,:memo)
    end
end
