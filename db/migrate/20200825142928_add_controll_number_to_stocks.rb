class AddControllNumberToStocks < ActiveRecord::Migration[5.2]
  def up
    add_column :stocks, :control_number, :integer
  end

  def down
    remove_column :stocks, :control_number, :integer
  end

end
