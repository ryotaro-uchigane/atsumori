class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.update(user_params)

    redirect_to action: :show, id: @user.id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    session[:user_id]
    redirect_to action: :show, id: @user.id
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    redirect_to login_path
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user
      flash[:notice] = 'ログインしました'
      session[:user_id] = @user.id
      redirect_to action: :index
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to action: :index
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :role)
    end
end
