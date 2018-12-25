class UserPromoCode < ApplicationRecord
  belongs_to :user
  has_many :promo_codes
end