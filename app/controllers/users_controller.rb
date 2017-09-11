class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  def index
    @user = User.find_by(id: session[:user_id])
    @events = get_events(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to action: :show, id: @user.id
    else
      render action: :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to action: :show, id: @user.id
    else
      render action: :new
    end
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

    def get_events(user)
      if user.role == 'job_hunting'
        following_event_ids = Following.where(user_id: user.id).pluck(:event_id)
        events = Event.find(following_event_ids)
      else
        events = user.events
      end
    end
end
