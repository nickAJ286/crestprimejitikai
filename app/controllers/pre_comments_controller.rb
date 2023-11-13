class PreCommentsController < ApplicationController
  def create
    @pre_comment = PreComment.new(pre_comment_params)
    if @pre_comment.save
      ActionCable.server.broadcast "pre_comment_channel", {pre_comment: @pre_comment, user: @pre_comment.user} 
      # redirect_to event_path(params[:event_id])
    else
      @event = @pre_comment.event
      @approvals = @event.approvals
      # @pre_comments = @event.pre_comments.includes(:user)
      render 'events/show'
    end
  end

  private
  def pre_comment_params
    params.require(:pre_comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
