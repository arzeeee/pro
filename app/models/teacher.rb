class Teacher < ApplicationRecord
  has_one :user_teacher
  has_one :user, through: :user_teacher
end