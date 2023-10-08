class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :catch_copy, :explanation, :event_date, :event_time, :place, :capacity, :price,
      :image).merge(user_id: current_user.id)
  end
end
