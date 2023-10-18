class AfterCommentsController < ApplicationController
  def create
    @after_comment = AfterComment.new(after_comment_params)
    if @after_comment.save
      redirect_to event_path(params[:event_id])
    end
  end

  private
  def after_comment_params
    params.require(:after_comment).permit(:content, :image).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
