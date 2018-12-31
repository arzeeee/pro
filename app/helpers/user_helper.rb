module UserHelper
  
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
    if student_detailed?
      @student_detail = UserStudent.find(current_user.id)
    end
  end
  
  def new_user?
    !student_detailed? && !student_verified?
  end
  
  def student_detailed?
    current_user.student != nil
  end
  
  def student_verified?
    current_user.user_verified != nil
  end
  
end