class Auth::SessionsController < Auth::BaseAuthController
  
  before_action :logged_in_redirect, only: [:new, :create]
  
  def new
    redirect_to mainmenu_path if logged_in?
  end

  def create
    if logged_in?
      redirect_to mainmenu_path
    else
      user = User.find_by_email(params[:session][:username_email])
      if !user
        user = User.find_by_username(params[:session][:username_email])
      end
      
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back, #{current_user.username}!"
        redirect_to mainmenu_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private
    def logged_in_redirect
      if logged_in?
        flash[:error] = "You are already logged in"
        redirect_to root_path
      end
    end


end