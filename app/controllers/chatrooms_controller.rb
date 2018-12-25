class ChatroomsController < ApplicationController
  
  before_action :require_log_in
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
end