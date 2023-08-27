class TweetsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "tweets_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast('tweets_channel', data)
  end
end
