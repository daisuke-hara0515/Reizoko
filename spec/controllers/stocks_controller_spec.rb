require 'rails_helper'

describe StocksController do
    it 'indexページをgetを使って取得できる' do
        get :index
        assert_response :success
        assert_select "title" , "Reizoko"
    end
    it 'newページをgetを使って取得できる' do
        get :new
        assert_response :success
    end
end