class UserQuiz < ApplicationRecord
  belongs_to :user
  has_many :quizzes
end