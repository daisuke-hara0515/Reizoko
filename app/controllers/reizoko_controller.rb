class ReizokoController < ApplicationController
    def login
    end

    def index
        @stock = Stock.all
    end

    def new
    end
    
    def form
    end

    def create
        stock = Stock.new(stock_params)
        stock.save!
        redirect_to reizoko_url, notice: "「#{stock.name}」の登録が完了しました"
    end

    private
    
    def stock_params
        params.require(:stock).permit(:name,:stock,:unit,:memo)
    end
end
