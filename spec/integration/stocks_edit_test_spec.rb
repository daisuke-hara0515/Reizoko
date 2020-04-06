require 'test_helper'

class StocksEditTest < ActionDispatch::IntegrationTest
  describe Stocks do
    before do
      @params = {name: "トマト", stock: 1, unit: "個"}
    end
    
    it "登録データが更新されていること" do
      
end
