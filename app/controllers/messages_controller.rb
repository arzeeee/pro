class MessagesController < ApplicationController
  
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
      foo: message.body
    else
      render chatroom_path
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:body)
    end
    
    def render_message(message)
      render_to_string(partial: 'message', locals: { message: message } )
    end
  
end