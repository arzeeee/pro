class User::DetailsController < ApplicationController
  
  def majors
    if params[:major].to_i > 0
      render :json => MajorInterest.where("university_id LIKE ?", "%#{params[:major]}%")
                                   .pluck_to_hash(:id,:majors)
    else
      render :json => MajorInterest.none
    end
  end
  
  def schools
    render :json => School.all
  end
  
  def grades
    if params[:grade].to_i==0
      render :json => Grade.where("gradeType LIKE ?", "%SMP%")
    elsif params[:grade].to_i==1
      render :json => Grade.where("gradeType LIKE ?", "%SMA%")
    else
      render :json => Grade.none
    end
  end
  
end