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
    # let(:stock_data) {FactoryBot.create(:stock, name: 'トマト',stock: 1,unit: "個",memo: "真っ赤",expire_date: "2021-01-01",control_number: 1)}
    let(:login_user) {user_a}

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
      new_stock_registration
    end

    it '新規在庫登録したらindex viewに載る' do
      expect(page).to have_selector 'td', text: 'トマト'
    end

    it '在庫登録したものを削除したらindex viewから消える' do
      click_on '削除'
      expect(page).to have_no_selector 'td', text: 'トマト'
    end

    it '既存在庫を更新したらindex viewに更新した情報が載る' do
      click_on '編集'
      fill_in 'stock[memo]',with: "編集テストだよ！"
      click_on '更新する'
      expect(page).to have_selector 'td', text: '編集テストだよ！'

    end

  end

  describe 'CSVに関するテスト' do
    it 'csvで新規登録を行ったら登録が成功すること' do
      # アップロードするファイル(データ？)を準備
      # 事前にログイン
      # アップロードファイルを選択
      # アップロード実行
    end
    it 'csvで既存在庫情報を変更したら更新成功すること' do
      # 後日てすと作成
    end
  end
end
