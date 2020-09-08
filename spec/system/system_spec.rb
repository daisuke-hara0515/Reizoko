require "rails_helper"

RSpec.describe 'stock管理画面一覧',type: :system do
  describe 'ログイン機能' do
    let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', email:'a@example.com')}
    let(:user_b) {FactoryBot.create(:user, name: 'ユーザーB', email:'b@example.com')}
    before do
      # FactoryBotをわざわざ見に行かなくても良いように一部の属性を変更している
      # user_a = FactoryBot.create(:user, name: 'ユーザーA', email:'a@example.com')  
      # FactoryBot.create(:stock, name:'キャベツ', user: user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end
    context 'ユーザーAがログインしている時'
      let(:login_user) {user_a}
      it 'navbarにユーザーAが表示されること' do
        # indexアクションでstockモデルが取得できること
        expect(page).to have_content 'ユーザーA'
      end
      
    context 'ユーザーBがログインしている時' do
      let(:login_user) {user_b}

      it 'navbarにユーザーAが表示されないこと' do
        expect(page).to have_no_content 'ユーザーA'
      end
    end
  end
  
  describe 'Stock(在庫)に関するテスト' do
    let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', email:'a@example.com')}
    let(:stock_data) {FactoryBot.create(:stock, name: 'トマト',stock: 1,unit: "個",memo: "真っ赤",expire_date: "2021-01-01")}
    let(:login_user) {user_a}

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
      click_on '新規登録'
      fill_in 'stock[name]', with: stock_data.name #fill_inに読み込ませるのはinputのname=""の部分
      fill_in 'stock[stock]', with: stock_data.stock
      fill_in 'stock[unit]', with: stock_data.unit
      fill_in 'stock[expire_date]', with: stock_data.expire_date
      fill_in 'stock[memo]', with: stock_data.memo
    end

    it '新規在庫登録したらindex viewに載る' do
      # テスト
    end

    it '既存在庫を削除したらindex viewから消える' do
    end

    it '既存在庫を更新したらindex viewに更新した情報が載る' do
    end

  end
end
