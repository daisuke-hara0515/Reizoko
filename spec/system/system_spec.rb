require "rails_helper"

RSpec.describe 'stock管理画面一覧',type: :system do
  describe 'stock表示機能' do
    before do
      # FactoryBotをわざわざ見に行かなくても良いように一部の属性を変更している
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email:'a@example.com')
      FactoryBot.create(:stock, name:'キャベツ', user: user_a)
    end
    context '登録ユーザーがログインしている時'
      before do
        # テストユーザーでログインする
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end
      
      it '登録ユーザーが作成した在庫が表示される' do
      # indexアクションでstockモデルが取得できること
      expect(page).to have_content 'キャベツ'
    end

    # it '登録ユーザーの在庫が更新できること' do
      # 適当なstockの編集ボタンをクリックする
      # 情報を入力する
      # 保存ボタンをクリックする
      # 更新が成功する(成功時のnoticeが表示される)
    # end
  end
end
