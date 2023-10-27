class ApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @approval = Approval.new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @approval = Approval.new(approval_params)
    if @approval.save
      redirect_to event_path(params[:event_id])
    else
      render 'index'
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @approval = Approval.find_by(user_id: current_user.id, event_id: @event.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @approval = Approval.find(params[:id])
    if @approval.update(approval_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  private

  def approval_params
    params.require(:approval).permit(:pros_and_cons_id, :opinion).merge(user_id: current_user.id,event_id: params[:event_id])
  end

  def check_role
    if current_user.role_id != 2
      redirect_to root_path
    end
  end
end
