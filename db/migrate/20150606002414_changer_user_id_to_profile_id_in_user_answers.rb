class ChangerUserIdToProfileIdInUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :temp, :integer
    execute <<-SQL
      UPDATE
        user_answers
      SET
        temp = profile_id;
    SQL
  end
end
