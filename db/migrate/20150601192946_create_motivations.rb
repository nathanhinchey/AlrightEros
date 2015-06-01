class CreateMotivations < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.string :body, null: false, unique: true

      t.timestamps null: false
    end

    add_column :profiles,
      :motivation_id,
      :integer,
      null: false,
      default: 1
  end
end
