class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :user

  def registration_open?
    event_day > Time.current
  end

end
