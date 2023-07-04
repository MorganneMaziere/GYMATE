class Review < ApplicationRecord
  # belongs_to :booking
  belongs_to :buddies_list
  belongs_to :user
  validates :comment, length: {minimum: 10}
end
