class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in_user
    unless session[:user_id]
      flash[:notice] = "ログインしてください"
      redirect_to login_path
    end
  end
end
