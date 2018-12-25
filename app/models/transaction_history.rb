class TransactionHistory < ApplicationRecord
  belongs_to :package
  belongs_to :transaction_status
  has_many :user_transactions
end