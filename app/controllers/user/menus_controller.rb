class User::MenusController < ApplicationController
  
  before_action :require_log_in, only: :mainmenu
  
  def welcome
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to mainmenu_path
    end
  end
  
  def mainmenu
    if new_user?
      redirect_to new_profile_path
    end
  end
  
  
end
