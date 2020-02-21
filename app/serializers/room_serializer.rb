class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :turn
  has_many :cards
end
