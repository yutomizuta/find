class Public::ChatsController < ApplicationController
  
  def create
    @chat = current_student.chats.new(chat_params)
    @chat.save
    redirect_back(fallback_location: root_path)
   end
  
   private
  
   def chat_params
    params.require(:chat).permit(:message, :room_id)
   end
end
