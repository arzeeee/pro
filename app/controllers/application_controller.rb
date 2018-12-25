class ApplicationController < ActionController::Base
  helper_method :logged_in?, :new_user?
  helper_method :current_user, :student_detail, :require_log_in
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_log_in
    if !logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to login_path
    end
  end
  
  def student_detail
    if current_user.student
      @student_detail = UserStudent.find(current_user.id)
    else
      redirect_to new_profile_path
    end
  end
  
  def new_user?
    current_user.student == nil 
  end
  
end
