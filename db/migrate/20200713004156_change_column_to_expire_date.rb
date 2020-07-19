class ChangeColumnToExpireDate < ActiveRecord::Migration[5.2]
  def up
    change_column :stocks, :expire_date, :datetime, null: false
  end

  def down
    change_column :stocks, :expire_date, :timewithzone
  end
end
