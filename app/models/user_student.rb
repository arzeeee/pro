class UserStudent < ApplicationRecord
  belongs_to :user
  belongs_to :student
  
  validates_uniqueness_of :user_id
  validates_uniqueness_of :student_id
end