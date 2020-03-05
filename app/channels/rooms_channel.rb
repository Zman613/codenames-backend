class RoomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # byebug
    room = Room.find(params[:id])
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # puts 'unsubscribed'
  end
end
