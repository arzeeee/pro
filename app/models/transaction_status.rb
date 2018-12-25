class TransactionStatus < ApplicationRecord
  has_many :transaction_histories
end