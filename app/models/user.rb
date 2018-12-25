class User < ApplicationRecord
  
  belongs_to :role
  
  has_many :user_lesson
  has_many :lessons, through: :user_lesson
  has_many :user_quizzes
  has_many :quizzes, through: :user_quiz
  has_many :user_transactions
  has_many :transactions, through: :user_transaction
  has_many :user_promo_codes
  has_many :promo_codes, through: :user_promo_code
  has_many :messages
  
  has_one :user_verified
  has_one :user_student
  has_one :student, through: :user_student
  has_one :user_teacher
  has_one :teacher, through: :user_teacher
  
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]+\z/
  VALID_EMAIL_REGEX = /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/i
  VALID_FULLNAME_REGEX = /\A[a-zA-Z ]+\z/
  VALID_PHONENO_REGEX = /\A08[0-9]{9,11}\b\z/
  
  has_secure_password
  
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 5, maximum: 15 },
                       format: { with: VALID_USERNAME_REGEX }
                      
  validates :email,    presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 10 },
                       format: { with: VALID_EMAIL_REGEX }
                       
  validates :password_digest,    
                       presence: true,
                       length: { minimum: 6 },
                       on: [:create, :save]
                       
  validates :fullname, presence: true,
                       length: { minimum: 5 },
                       format: { with: VALID_FULLNAME_REGEX }
                       
  validates :phoneNo,  presence: true,
                       uniqueness: true,
                       length: { minimum: 5 },
                       format: { with: VALID_PHONENO_REGEX }  
                       
end