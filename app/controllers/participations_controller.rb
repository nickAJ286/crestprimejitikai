class ParticipationsController < ApplicationController
  def index
    @participation = Participation.new
    @event = Event.find(params[:event_id])
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.save
    redirect_to event_path(params[:event_id])
  end

  def edit
    @event = Event.find(params[:event_id])
    @participation = Participation.find_by(user_id: current_user.id, event_id: @event.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @participation = Participation.find(params[:id])
    if @participation.update(participation_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:name, :number, :choice_id).merge(user_id: current_user.id,event_id: params[:event_id])
  end
end
