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
        stock = Stock.new(stock_params)
        stock.save
        redirect_to root_path
    end

    def show
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:unit,:stock,:memo)
    end
end