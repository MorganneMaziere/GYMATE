class Sport < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_sports, dependent: :destroy
end
