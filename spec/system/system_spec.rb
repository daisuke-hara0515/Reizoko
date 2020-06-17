require "rails_helper"

RSpec.describe 'stock管理画面一覧',type: :system do
  describe 'stock表示機能' do
    before do
      user = FactoryBot.create(:user)
      FactoryBot.create(:stock, user: user)
    end
    context '登録ユーザーがログインしている時'
      before do
        # テストユーザーでログインする
      end
      
      it '登録ユーザーが作成した在庫が表示される' do
      # indexアクションでstockモデルが取得できること
    end

    it '登録ユーザーの在庫が更新できること' do
      # 適当なstockの編集ボタンをクリックする
      # 情報を入力する
      # 保存ボタンをクリックする
      # 更新が成功する(成功時のnoticeが表示される)
    end
  end
end
