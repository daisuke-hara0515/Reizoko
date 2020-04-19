require "rails_helper"

RSpec.describe 'stock管理機能',type: :system do
  let(:stock) {FactoryBot.create(:stock)}
  describe 'stock存在性' do
    it 'is valid?' do
        expect(stock.valid?).to be true
    end
  end

  # 在庫情報の更新テストは後ほど作る
  describe '在庫情報がアップデートできること' do
    it '登録している在庫情報をアップデートできること' do
        # 登録データをpatchしてupdateする
        # このサイトでFactoryBotの基本載っている。https://www.yako-geppo.com/entry/rails-rspec-factorybot
        # visit edit_stock_path(stock)
        # put stock_path(stock),params: { stock: {name: "potato"}}
        # expect(stock.reload).to be true
    end
  end
end