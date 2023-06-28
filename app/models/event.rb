class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :bookings, dependent: :destroy

  def registration_open?
    event_day > Time.current
  end

end
