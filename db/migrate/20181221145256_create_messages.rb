class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.timestamp
    end
  end
end
