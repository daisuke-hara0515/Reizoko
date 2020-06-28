class ChangeDataStockToStocks < ActiveRecord::Migration[5.2]
  def change
    change_column :stocks, :stock, :float
  end
end
