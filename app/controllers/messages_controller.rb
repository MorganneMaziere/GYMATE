class MessagesController < ApplicationController
  def create
    @buddies_list = BuddiesList.find(params[:buddies_list_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to buddies_list_chatroom_path(@buddies_list, @chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
