class User < ApplicationRecord
  belongs_to :room
  has_many :messages
  has_many :spy_messages
end

