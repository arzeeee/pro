class CreateDatabaseTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :email, null: false
      t.string :password_digest
      t.string :fullname
      t.string :phoneNo
      t.references :role, foreign_key: true
      t.datetime
    end
    
    create_table :packages do |t|
      t.string :packageItem
      t.integer :price
      t.text :packageDescription
      t.datetime
    end
    
    create_table :transaction_statuses do |t|
      t.string :statusOfTransaction
      t.datetime
    end
    
    create_table :teachers do |t|
      t.integer :balance
      t.string :address
      t.date :dob
      t.string :university
      t.float :gpa
      t.datetime
    end
    
    create_table :teacher_roles do |t|
      t.string :role
      t.datetime
    end
    
    create_table :lesson_items do |t|
      t.references :lesson, foreign_key: true
      t.text :richtext
      t.string :urlVideo
      t.datetime
    end
    
    create_table :subjects do |t|
      t.string :subjectName
      t.datetime
    end
    
    create_table :promo_codes do |t|
      t.text :promoDescription
      t.date :expiryDate
      t.integer :usedBy
      t.datetime
    end
    
    create_table :transaction_histories do |t|
      t.references :package, foreign_key: true
      t.integer :amountPaid
      t.integer :paymentType
      t.references :transaction_statuses, foreign_key: true
      t.datetime
    end
    
    create_table :user_teachers do |t|
      t.references :user, foreign_key: true
      t.references :teacher_detail, foreign_key: true
      t.references :teacher_role, foreign_key: true
      t.datetime
    end
    
    create_table :user_verifieds do |t|
      t.references :user, foreign_key: true
      t.integer :codeGenerated
      t.integer :codeVerified
      t.boolean :isVerified?
      t.datetime
    end
    
    create_table :lessons do |t|
      t.string :lessonName
      t.string :chapter
      t.integer :price
      t.string :lessonType
      t.references :subject, foreign_key: true
      t.references :grade, foreign_key: true
      t.datetime
    end
    
    create_table :grades do |t|
      t.string :gradeName
      t.string :gradeType
      t.datetime
    end
    
    create_table :user_promo_codes do |t|
      t.references :user, foreign_key: true
      t.references :promo_code, foreign_key: true
      t.datetime
    end
    
    create_table :user_transactions do |t|
      t.references :user, foreign_key: true
      t.references :transaction, foreign_key: true
      t.datetime
    end
    
    create_table :user_lessons do |t|
      t.references :lesson, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime
    end
    
    create_table :user_students do |t|
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :balance, default: 5000
      t.integer :point, default: 0
      t.datetime
    end
    
    create_table :roles do |t|
      t.string :roleName
      t.datetime
    end
    
    create_table :user_quizzes do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
      t.datetime
    end
  
    create_table :students do |t|
      t.date :dob
      t.references :school, foreign_key: true
      t.references :province, foreign_key: true
      t.string :nise
      t.references :university, foreign_key: true
      t.references :major_interest, foreign_key: true
      t.references :grade, foreign_key: true
      t.boolean :is_edulab, default: false
      t.string :referredBy, default: "-"
      t.datetime
    end
    
    create_table :quizzes do |t|
      t.references :lesson, foreign_key: true
      t.references :category, foreign_key: true
      t.datetime :time
      t.datetime
    end
    
    create_table :categories do |t|
      t.string :categoryName
      t.datetime
    end
    
    create_table :schools do |t|
      t.references :city, foreign_key: true
      t.string :schoolName
      t.datetime
    end
    
    create_table :cities do |t|
      t.references :province, foreign_key: true
      t.string :cityName
      t.string :timezone, default: "WIB"
      t.datetime
    end
    
    create_table :provinces do |t|
      t.string :provinceName
      t.datetime
    end
    
    create_table :problems do |t|
      t.references :quiz, foreign_key: true
      t.text :text
      t.string :description
      t.datetime
    end
    
    create_table :major_interests do |t|
      t.integer :code
      t.string :majors
      t.references :university, foreign_key: true
      t.integer :capacity
      t.float :passingGrade
      t.string :year
      t.datetime
    end
    
    create_table :universities do |t|
      t.string :universityName
      t.datetime
    end
    
    create_table :old_accounts do |t|
      t.string :username
      t.string :email
      t.string :fullname
      t.string :phoneNo
      t.date :dob
      t.string :school
      t.datetime
    end
    
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :action
      t.datetime
    end
    
    create_table :answers do |t|
      t.references :problem, foreign_key: true
      t.boolean :isCorrect?
      t.string :textAnswer
      t.datetime
    end
    
  end
end
