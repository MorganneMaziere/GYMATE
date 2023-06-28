class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :description ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }

  def registration_open?
    event_day > Time.current
  end
end
