class University < ApplicationRecord
  has_many :students
  has_many :major_interests
end