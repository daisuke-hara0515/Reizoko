class AddExpireDateToStocks < ActiveRecord::Migration[5.2]
  def up
    add_column :stocks, :expire_date, :datetime
    change_column :stocks, :expire_date, :datetime,  null: false
  end
end
