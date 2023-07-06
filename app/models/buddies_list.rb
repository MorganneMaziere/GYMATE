class BuddiesList < ApplicationRecord
  belongs_to :user
  belongs_to :buddy, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  # after_create :create_chatroom

  def self.reacted?(id1, id2)
    case1 = !BuddiesList.where(user_id: id1, buddy_id: id2).empty?
    case2 = !BuddiesList.where(user_id: id2, buddy_id: id1).empty?
    case1 || case2
  end

  def self.confirmed_record?(id1, id2)
    case1 = !BuddiesList.where(user_id: id1, buddy_id: id2, confirmed: true).empty?
    case2 = !BuddiesList.where(user_id: id2, buddy_id: id1, confirmed: true).empty?
    case1 || case2
  end

  def self.find_buddieslist(id1, id2)
    if BuddiesList.where(user_id: id1, buddy_id: id2, confirmed: true).empty?
      BuddiesList.where(user_id: id2, buddy_id: id1, confirmed: true)[0].id
    else
      BuddiesList.where(user_id: id1, buddy_id: id2, confirmed: true)[0].id
    end
  end

  # def create_chatroom
  #   Chatroom.create(buddies_list: self)
  # end

end
