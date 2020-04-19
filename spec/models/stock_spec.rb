require "rails_helper"

RSpec.describe Stock,type: :model do
  describe 'stockモデルの有効性' do
    let(:stock) {Stock.new(name:'tomato',stock:1,unit:'個')}
    it 'stock.valid?' do
        expect(stock.valid?).to be true
    end
  end

    it '登録している在庫情報をアップデートできること' do
        # 登録データをpatchしてupdateする
        patch stock_url(tomato), stock: {name: "potato"}
        expect(stock.reload.name).to eq "potato"
    end
end