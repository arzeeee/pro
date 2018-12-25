class Student < ApplicationRecord
  
  has_one :user_student
  has_one :user, through: :user_student
  belongs_to :school
  belongs_to :university
  belongs_to :province
  belongs_to :major_interest
  belongs_to :grade

end