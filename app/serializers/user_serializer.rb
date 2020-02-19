class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :team, :spymaster, :room_id
end
