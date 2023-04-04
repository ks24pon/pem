class SessionsController < ApplicationController
  # ログイン画面
  def new
  end
  # ログイン処理
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to articles_index_path
    else
      render 'new'
    end
  end
  # ログアウト処理
  def destroy
    log_out if logged_in?
    redirect_to articles_index_path
  end
end
