class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user_id = session[:user_id]
    if(event.save)
      redirect_to action: :show, id: event.id
    else
      redirect_to action: :new
    end
  end

  def update
    event = Event.find(params[:id])
    if(event.update(event_params))
      redirect_to action: :show, id: event.id
    else
      redirect_to action: :edit, id: event.id
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to action: :index
  end

  private

    def event_params
      params.require(:event).permit(:title, :description, :public)
    end

    def logged_in_user
      unless session[:user_id]
        flash[:notice] = "ログインしてください"
        redirect_to login_path
      end
    end

end
