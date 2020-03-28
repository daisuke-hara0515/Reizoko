require "rails_helper"

RSpec.describe 'Stockモデル',type: :system do
    describe 'stockモデルの有効性'
    before do
        @stock = FactoryBot.create(:stock)
    end

    it 'stock.valid?' do
        expect(@stock.valid?).to be true
    end
end