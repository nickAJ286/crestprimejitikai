class BeforeCommentsController < ApplicationController
  def create
    @before_comment = BeforeComment.new(before_comment_params)
    @event = Event.find(params[:event_id])
    if @before_comment.save
      BeforeCommentChannel.broadcast_to @event, { before_comment: @before_comment, user: @before_comment.user } #追加
      # ActionCable.server.broadcast "before_comment_channel", {before_comment: @before_comment, user: @before_comment.user} #追加
      # redirect_to event_path(params[:event_id])
    end
  end

  private
  def before_comment_params
    params.require(:before_comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
