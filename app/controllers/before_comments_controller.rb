class BeforeCommentsController < ApplicationController
  def create
    @before_comment = beforeComment.new(before_comment_params)
    if @before_comment.save
      redirect_to event_path(params[:event_id])
    end
  end

  private
  def before_comment_params
    params.require(:before_comment).permit(:content).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
