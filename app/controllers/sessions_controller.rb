class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログイン成功'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしたよ！'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
