class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.boolean :is_read, default: false

      t.timestamps
    end

    add_index :messages, :receiver_id
    add_index :messages, [:sender_id, :receiver_id]
  end
end
