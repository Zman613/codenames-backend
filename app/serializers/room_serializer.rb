class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :turn
end
