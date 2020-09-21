module NewStockRegistrationHelpers
    def new_stock_registration
      click_on '新規登録'
      fill_in 'stock[name]', with: "トマト"
      fill_in 'stock[stock]', with: 1
      fill_in 'stock[unit]', with: "個"
      fill_in 'stock[expire_date]', with: "002020-01-01"
      fill_in 'stock[memo]', with: "テスト"
      click_on '登録する'
    end
end
