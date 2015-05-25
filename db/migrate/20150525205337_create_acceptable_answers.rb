class CreateAcceptableAnswers < ActiveRecord::Migration
  def change
    create_table :acceptable_answers do |t|
      t.references :user_answer, null: false
      t.references :answer, null: false

      t.timestamps null: false
    end
  end
end
