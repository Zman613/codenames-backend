class CardSerializer < ActiveModel::Serializer
  attributes :id, :word, :team, :clicked, :room_id
end
