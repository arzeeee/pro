class MajorInterest < ApplicationRecord
  has_many :students
  belongs_to :university  
end