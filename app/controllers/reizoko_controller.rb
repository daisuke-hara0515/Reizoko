class ReizokoController < ApplicationController
    def login
    end

    def zaiko
        @stock = Stock.find(params[:id])
    end

    def new
        @stock = Stock.new
    end
    
    def form
    end
end
