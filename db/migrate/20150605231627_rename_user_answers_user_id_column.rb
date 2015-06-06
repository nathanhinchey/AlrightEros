class RenameUserAnswersUserIdColumn < ActiveRecord::Migration
  def change
    rename_column :user_answers, :user_id, :profile_id
  end
end
