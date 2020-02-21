class RoomsController < ApplicationController

  def create
    
  end

  def update
  end

  def join_room
    # room = Room.find(room_params[:id])
    room = Room.find(1)
    render json: room
  end

  def click
    card = Card.find(room_params[:id])
    card.update(clicked: true)
    room = Room.find(1)
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
        RoomSerializer.new(room)
      ).serializable_hash
    RoomsChannel.broadcast_to room, serialized_data
    head :ok
  end

  def new_game
    room = Room.find(room_params[:id])
    room.new_game
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      RoomSerializer.new(room)
    ).serializable_hash
    RoomsChannel.broadcast_to room, serialized_data
    head :ok
  end

  private

  def room_params
    params.require(:room).permit(:id)
  end

end
