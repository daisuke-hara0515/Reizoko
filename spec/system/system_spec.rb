require "rails_helper"

RSpec.describe 'stockモデル',type: :system do
  describe 'stock登録' do
    it '登録ユーザーでログインすると在庫のindexが表示されること' do
      # ログインページを取得する
      # 登録ユーザーでログインする
      # ログインが成功する(ログイン成功のnoticeが表示されること)
      # indexアクションでstockモデルが取得できること


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
