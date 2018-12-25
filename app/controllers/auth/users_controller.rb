class Auth::UsersController < Auth::BaseAuthController

  def new
    @user = User.new
    @example = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation
      @user.role_id = Role.where("roleName like ? ", 'Student').pluck(:id)[0]
      if @user.save
        redirect_to login_path
      else
        redirect_to sign_up_path
      end
    else
      redirect_to sign_up_path
    end
  end
  
  def details
    @user = params[:user]
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :fullname, :email, 
                                   :password, :password_confirmation, :phoneNo)
    end
    
end
