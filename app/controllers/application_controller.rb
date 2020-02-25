class ApplicationController < ActionController::API

  def encode_token(id)
    JWT.encode({room_id: id}, ENV['PASSWORD'])
  end
  
  def user_token(id)
    JWT.encode({user_id: id}, ENV['PASSWORD'])
  end

  def get_auth_header
    request.headers["Authorization"]
  end

  def get_auth_header_user
    request.headers["User"]
  end

  def decoded_token
    begin
      JWT.decode(get_auth_header, ENV['PASSWORD'])[0]["room_id"]
    rescue
      nil
    end
  end

  def decoded_user
    begin
      JWT.decode(get_auth_header_user, ENV['PASSWORD'])[0]["user_id"]
    rescue
      nil
    end
  end

  def session_room
    Room.find_by(id: decoded_token)
  end

  def session_user
    User.find_by(id: decoded_user)
  end

  def logged_in?
    !!session_room
  end

end
