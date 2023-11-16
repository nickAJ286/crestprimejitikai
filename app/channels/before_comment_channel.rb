class BeforeCommentChannel < ApplicationCable::Channel
  def subscribed
    @event = Event.find(params[:event_id]) # 追記
    stream_for @event # 追記
    # stream_from "before_comment_channel" #追加
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
