class AddexpireDateToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :expire_date, :timewithzone
  end
end
