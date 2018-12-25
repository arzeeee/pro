class City < ApplicationRecord
  has_many :schools
  belongs_to :province
end