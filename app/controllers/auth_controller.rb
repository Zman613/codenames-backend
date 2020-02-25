class AuthController < ApplicationController

  def login
    room = Room.find_by(name: params[:name])

    if room && room.authenticate(params[:password])
      token = encode_token(room.id)
      user = User.find_or_create_by(username: params[:username], room_id: room.id)
      userToken = user_token(user.id)
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
          RoomSerializer.new(room)
        ).serializable_hash
      render json: {room: serialized_data, token: token, user: user, userToken: userToken}
    else
      render json: {errors: "You dun goofed!"}
    end
  end

  def auto_login
    # byebug
    if session_room && session_user
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
          RoomSerializer.new(session_room)
        ).serializable_hash
      render json: {room: serialized_data, user: session_user}
    else 
      render json: {errors: "That ain't no room I ever heard of!"}
    end
    
  end
end