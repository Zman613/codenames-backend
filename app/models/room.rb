class Room < ApplicationRecord
  has_many :cards
  has_many :users
  has_many :messages
  has_many :spy_messages
end
