class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :room_id, :user_id
end
