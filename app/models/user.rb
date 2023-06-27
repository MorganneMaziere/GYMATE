class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :BuddiesList
  has_many :buddies, through: :BuddiesList
  has_many :registrations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "buddy_id"

  def registered_for?(event)
    registrations.exists?(event_id: event.id)
  end

  def buddies
    buddies_i_sent_invitation = BuddiesList.where(user_id: id, confirmed: true).pluck(:buddy_id)
    buddies_i_got_invitation = BuddiesList.where(buddy_id: id, confirmed: true).pluck(:user_id)
    ids = buddies_i_sent_invitation + buddies_i_got_invitation
    User.where(id: ids)
  end
end
