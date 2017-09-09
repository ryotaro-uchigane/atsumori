class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user_id = 1
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

end
