require 'rails_helper'

describe StocksController do
    it 'indexページをgetを使って取得できる' do
        get :index
        assert_response :success
    end
    it 'newページをgetを使って取得できる' do
        get :new
        assert_response :success
    end

    it 'rootページから新規登録リンクを踏んでnewページに移ること' do

    end
    
    it '在庫名、個数、単位は空では登録できず、エラーが発生すること' do

    end
    
    it '在庫名はstring、個数はinteger、単位はstring以外を入力したらエラーになること' do

    end

end