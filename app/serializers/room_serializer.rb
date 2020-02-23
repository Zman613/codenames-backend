class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :turn, :start
  has_many :cards
end
