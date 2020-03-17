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
end
