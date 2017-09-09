class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user
      flash[:notice] = 'ログインしました'
      redirect_to("/users/#{@user.id}")
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      render('users/login_form')
    end
  end
end
