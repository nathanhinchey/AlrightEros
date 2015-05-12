class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :session_token, null: false, unique: true

      t.timestamps null: false
    end

    add_index :sessions, :session_token
    add_index :users, :email
  end
end
