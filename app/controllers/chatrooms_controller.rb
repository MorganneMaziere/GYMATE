class ChatroomsController < ApplicationController

  def index
    @chatrooms = current_user.chatrooms
  end

  def show
    @buddies_list = BuddiesList.find(params[:buddies_list_id])
    @chatroom = @buddies_list.chatroom
    @message = Message.new
  end

  def create
    @buddies_list = BuddiesList.find(params[:buddies_list_id])
    @chatroom = Chatroom.new(buddies_list: @buddies_list)
    @chatroom.save!
    redirect_to buddies_list_chatroom_path(@buddies_list, @chatroom)
  end
end
