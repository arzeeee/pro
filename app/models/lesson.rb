class Lesson < ApplicationRecord
  belongs_to :subject
  belongs_to :grade
  has_many :lesson_items
  has_many :quizzes
end