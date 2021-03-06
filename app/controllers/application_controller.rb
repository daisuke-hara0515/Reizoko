class ApplicationController < ActionController::Base
  
  # helper_methodはcontrollerに定義したメソッドをviewでも使えるようにする。
    helper_method :current_user
    before_action :login_required #login_requiredメソッドを定義し、ログインしていない場合は在庫管理できないようにする。

    private # クラスの外からアクセスできると情報が見えてしまうからprivateに隠す？
    
    def current_user
      # @current_user = @current_user || User.find~で、左項から判定していきtrueになったら処理終了。
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      redirect_to login_path unless current_user
    end
end
