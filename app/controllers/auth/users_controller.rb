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
        redirect_to verification_path(phoneNo: @user.phoneNo)
      else
        wrong_credential(@user)
      end
    else
      wrong_credential(@user)
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :fullname, :email, 
                                   :password, :password_confirmation, :phoneNo)
    end
    
    def wrong_credential(user)
      if User.where(:username => user.username).exists?
        flash[:error] = "Username already taken"
      elsif User.where(:email => user.email).exists?
        flash[:error] = "Email already taken"
      elsif User.where(:phoneNo => user.phoneNo).exists?
        flash[:error] = "Phone number already taken"
      elsif user.password.length < 6
        flash[:error] = "Pasword too short"
      else
        flash[:error] = "Credential error, please try again"
      end
      redirect_to sign_up_path  
    end
      
    
end
