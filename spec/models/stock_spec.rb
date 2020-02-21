require "rails_helper"

RSpec.describe 'stockの有効性' do
    it 'stock.valid?' do
        stock = Stock.new
        expect(stock.valid?).to be true
    end
end