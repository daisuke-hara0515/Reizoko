require 'rails_helper'

describe StocksController do
    # it 'indexページをgetを使って取得できる' do
    #     get :index
    #     assert_response :success
    # end
    # it 'newページをgetを使って取得できる' do
    #     get :new
    #     assert_response :success
    # end

    it 'indexページから新規登録リンクを踏んでnewページに移ること' do
        visit root_path
        assert_response :success
        assert_template 'stocks/index'
        click_on '新規登録'
        assert_response :success
        assert_template 'stocks/new'
    end

    # このテストの書き方は正しいのか？なんかもっとまとめられないか
    it '新規登録が成功すること(正常系)' do
        visit new_stock_path
        fill_in 'stock_name', with: 'トマト'
        fill_in 'stock_stock' , with: 1
        fill_in 'stock_unit' , with: '個'
        click_button '登録する'
        expect(page).to have_content '「トマト」を新規登録しました！'        
    end
    
    #このテストの書き方は正しいのか？なんかもっとまとめられないか
    it '新規登録が失敗すること(異常系)' do
        visit new_stock_path
        fill_in 'stock_stock' , with: 1
        fill_in 'stock_unit' , with: '個'
        click_button '登録する'
        expect(page).to have_content '在庫名を入力してください'
    end
end