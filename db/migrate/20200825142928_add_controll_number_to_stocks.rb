class AddControllNumberToStocks < ActiveRecord::Migration[5.2]
  def up
    add_column :stocks, :control_number, :string
  end

  def down
    remove_column :stocks, :control_number, :string
  end

end
