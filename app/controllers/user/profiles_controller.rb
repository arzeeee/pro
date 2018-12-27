class User::ProfilesController < User::BaseUserController
  
  before_action :new_user_only, only: :new
  
  def new
    @student = Student.new
    @grade = Grade.all
    @university = University.all
  end
  
  def create
    @student = Student.new(student_params)
    @student.province_id = 
        City.joins(:schools)
        .joins(:province)
        .where("schools.id LIKE ?", @student.school_id)
        .pluck(:province_id).first
    @student.nise = "-"
    @student.is_edulab = false
    @student.user = current_user
    if @student.save
      flash[:success] = "Welcome #{current_user.username}!"
      redirect_to mainmenu_path
    else
      flash[:error] = "Credentials error, please try again"
      redirect_to new_profile_path
    end
  end
  
  private
    def student_params
      params.require(:student)
            .permit(:dob, :school_id, :major_interest_id, 
                    :university_id, :grade_id, :referredBy,
                    :province_id, :nise, :is_edulab, :user)
    end
    
    def new_user_only
      if !new_user?
        redirect_to mainmenu_path
      end
    end
    

end