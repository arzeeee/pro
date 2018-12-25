class School < ApplicationRecord
  belongs_to :city
  has_many :students
end