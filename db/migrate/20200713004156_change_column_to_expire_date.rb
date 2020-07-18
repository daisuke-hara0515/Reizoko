class ChangeColumnToExpireDate < ActiveRecord::Migration[5.2]
  def change
    change_column :stocks, :expire_date, :datetime, null: false
  end
end
