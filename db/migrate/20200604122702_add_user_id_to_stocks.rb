class AddUserIdToStocks < ActiveRecord::Migration[5.2]
  def up # このマイグレーションの目的は既存のstock(在庫)がどのユーザーのものなのか紐付けできずnot nullに引っかかる
    execute 'DELETE FROM stocks;'
    add_reference :stocks,:user,null: false, index:true
  end

  def down #downメソッドはマイグレーションのrollbackが発生した時に呼び出される(upと逆のことが行われる)
    remove_reference :stocks, :user, index: true
  end
end
