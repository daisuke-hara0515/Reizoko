require "rails_helper"

RSpec.describe 'Stockモデル',type: :model do
    describe 'stockモデルの有効性'
    before do
        @stock = FactoryBot.create(:stock)
    end

    it 'stock.valid?' do
        expect(@stock.valid?).to be true
    end

    # it '登録している在庫情報をアップデートできること' do
    #     # attributes_forは対象の属性をHashで返す、オプションで
    #     stock_params = FactoryBot.attributes_for(:stock, name: "tomato")
    #     patch stocks_path(stock), params: {id :stock.id, stock: stock_params}
    #     expect(stock.reload.name).to eq "tomato"
    # end

end