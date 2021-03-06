class RoomsController < ApplicationController

  def create
    room = Room.new(
      name: params[:name],
      password: params[:password],
    )

    if room.save
      room.brand_new_game
      token = encode_token(room.id)
      user = User.create(username: params[:username], room_id: room.id)
      userToken = user_token(user.id)
      serialized_data = serializer(room)
      render json: {room: serialized_data, token: token, user: user, userToken: userToken}
    else
      render json: {errors: room.errors.full_messages}
    end

  end

  def update
  end

  def join_room
    # room = Room.find(room_params[:id])
    room = Room.find(1)
    render json: room
  end

  def click
    card = Card.find(room_params[:card_id])
    
    if card.update(clicked: true)
      room = Room.find(room_params[:id])
      if card.team == 'assassin'
        if room.turn == 'blue'
          room.update(turn: 'red win')
        elsif room.turn == 'red'
          room.update(turn: 'blue win')
        end
      elsif card.team != room[:turn]
        if room[:turn] == 'red'
          room.update(turn: 'blue')
        elsif room[:turn] == 'blue'
          room.update(turn: 'red')
        end
      end
      serialized_data = serializer(room)
      RoomsChannel.broadcast_to room, serialized_data
      head :ok
    end
  end

  def new_game
    room = Room.find(room_params[:id])
    users = User.all.select{|user| user.room_id == room.id}
    users.each{|user| user.update(team: nil)}
    room.new_game
    serialized_data = serializer(room)
    UsersChannel.broadcast_to room, users
    head :ok
    RoomsChannel.broadcast_to room, serialized_data
    head :ok
  end

  def next_turn
    room = Room.find(room_params[:id])
    if room[:turn] == 'red'
      room.update(turn: 'blue')
    elsif room[:turn] == 'blue'
      room.update(turn: 'red')
    end
    serialized_data = serializer(room)
    RoomsChannel.broadcast_to room, serialized_data
    head :ok
  end

  def game_over
    room = Room.find(room_params[:id])
    if room.turn == 'red'
      room.update(turn: 'red win')
    elsif room.turn == 'blue'
      room.update(turn: 'blue win')
    end
    serialized_data = serializer(room)
    RoomsChannel.broadcast_to room, serialized_data
    head :ok
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
  end

  private

  def room_params
    params.require(:room).permit(:id, :card_id)
  end

  def serializer(room)
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
          RoomSerializer.new(room)
        ).serializable_hash
    serialized_data
  end

end
