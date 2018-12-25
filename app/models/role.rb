class Role < ApplicationRecord
  has_many :users
  validates_uniqueness_of :roleName
end