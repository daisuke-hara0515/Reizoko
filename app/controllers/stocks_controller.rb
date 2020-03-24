class StocksController < ApplicationController
    def index
        @stock = Stock.all
    end

    def create
        @stock = Stock.new(stock_params)
        @stock.save!
        redirect_to stocks
    end

    def show
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:unit,:stock,:memo)
    end
end
