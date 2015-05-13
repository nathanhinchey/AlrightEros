class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false, foreign_key: true, unique: true, index: true
      t.string :username, null: false, unique: true
      t.date :birthday, null: false
      t.text :summary

      t.timestamps null: false
    end
  end
end
