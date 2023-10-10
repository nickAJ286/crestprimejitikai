class ApprovalsController < ApplicationController
  def index
    @approval = Approval.new
    @event = Event.find(params[:event_id])
  end

  def create
    @approval = Approval.new(approval_params)
    @approval.save
    redirect_to event_path(params[:event_id])
  end

  private

  def approval_params
    params.require(:approval).permit(:pros_and_cons_id, :opinion).merge(user_id: current_user.id,event_id: params[:event_id])
  end
end
