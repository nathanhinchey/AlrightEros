class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.references :user, null: false
      t.references :answer, null: false

      t.timestamps
    end
  end
end
