class Quiz < ApplicationRecord
  belongs_to :lesson
  belongs_to :category
  
  has_many :user_quizzes
  has_many:problems
  
end