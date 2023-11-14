class PreCommentChannel < ApplicationCable::Channel
  def subscribed
    @event = Event.find(params[:event_id]) # 追記
    stream_for @event # 追記
    # stream_from "pre_comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
