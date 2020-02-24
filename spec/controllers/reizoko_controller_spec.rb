require 'rails_helper'

class ReizokoControllerTest < ActionController::TestCase
    describe ReizokoController do
        it 'indexページをgetを使って取得できる' do
            get :index
            assert_response :success
        end
    end
end