class StocksController < ApplicationController
    def index
        @stock = Stock.all
    end

    def create
    end

    def show
    end
end
