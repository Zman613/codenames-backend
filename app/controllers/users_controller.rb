class UsersController < ApplicationController
  def index
    if logged_in?
      room = session_room
      users = User.all.select{|user| user.room_id == room.id}
      render json: users
    end
  end

  def update
    user = User.find(params[:id])
    user.update(team: params[:team])
    users = User.all.select{|u| u.room_id == user.room_id}
    room = Room.find(user.room_id)
    UsersChannel.broadcast_to room, users
    head :ok
  end

  def spymaster
    # byebug
    user = User.find(params[:id].to_i)
    user.update(spymaster: params[:sm])
    room = Room.find(user.room_id)
    users = User.all.select{|u| u.room_id == user.room_id}
    UsersChannel.broadcast_to room, users
    head :ok
  end
end
