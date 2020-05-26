class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new #newメソッドで空っぽのインスタンスを作る
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create #登録画面に入力されたparamsを引数にインスタンス変数作成
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
      else
        render :new
      end
    end

    def destroy #登録ユーザーを完全に削除する
      @user = User.find(params[:id])
      @user.destroy

      # _urlは絶対パス。httpの仕様上、リダイレクトの時に完全なURLを求められる為。
      # admin_usersからadmin_userという別のURLに飛ばしたいから_url
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
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
