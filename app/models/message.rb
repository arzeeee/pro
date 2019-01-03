class Message < ApplicationRecord
  belongs_to :user
  
  def self.sendmessage(msg,user)
    ActionCable.server.broadcast 'chatroom_channel', 
    message: msg.body,
    user: user.username
  end
  
end