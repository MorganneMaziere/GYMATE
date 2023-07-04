class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :buddies_list
end
