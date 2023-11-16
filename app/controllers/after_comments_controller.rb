class AfterCommentsController < ApplicationController
  def create
    @after_comment = AfterComment.new(after_comment_params)
    @event = Event.find(params[:event_id])
    if @after_comment.save
      AfterCommentChannel.broadcast_to @event, { after_comment: @after_comment, user: @after_comment.user } #追加
      # redirect_to event_path(params[:event_id])
    end
  end

  private
  def after_comment_params
    params.require(:after_comment).permit(:content, :image).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
