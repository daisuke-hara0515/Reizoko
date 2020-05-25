class Admin::UsersController < ApplicationController
  def new #newメソッドで空っぽのインスタンスを作る
    @user = User.new
  end

  def create #登録画面に入力されたparamsを引数にインスタンス変数作成
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end

    private

    def user_params #strong parameter
      params.require(:user).permit(:name,:email,:admin,:password,:password_confirmation)
    end
  end

  def edit
  end

  def show
  end

  def index
  end
end
