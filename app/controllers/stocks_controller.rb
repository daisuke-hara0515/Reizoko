require 'csv'

class StocksController < ApplicationController
    def index # order(name: :asc)で名前順に表示させるようにしたい
        @stocks = current_user.stocks.order(name: :asc)
        respond_to do |format|
          format.html
          format.csv do |csv|
            send_posts_csv(@stocks)
          end
        end
    end

    def send_posts_csv(stocks)
        csv_data = CSV.generate do |csv|
            header = %w(control_number name stock unit memo expire_date)
            csv << header

            stocks.each do |stock|
                values = [stock.control_number,stock.name,stock.stock,stock.unit,stock.memo,stock.expire_date]
                csv << values
            end
        end
        send_data(csv_data, filename: "stocks.csv")
    end

    def import
        Stock.import(params[:file],current_user)
        redirect_to stocks_url
    end
    
    # 器の準備
    def new
        @stocks = Stock.new
    end

    # 器にパラメータを注ぐ
    def create
        @stocks = current_user.stocks.new(stock_params)
        @stocks.expire_date = Date.parse(stock_params[:expire_date])
        if @stocks.save
          redirect_to stocks_path, notice: "「#{@stocks.name}」を新規登録しました！"
        else render :new
        end
    end

    def show
    end

    def edit
        @stocks = Stock.find(params[:id])
    end

    def update
        @stocks = Stock.find(params[:id])
        if @stocks.update_attributes(stock_params)
            redirect_to stocks_path, notice: "「#{@stocks.name}」が更新されました！"
        else render :edit
        end
    end

    def destroy
      @stocks = Stock.find(params[:id])
      @stocks.destroy
      redirect_to stocks_path, notice: "「#{@stocks.name}」が削除されました！"
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:unit,:stock,:expire_date,:memo,:control_number)
    end
end
