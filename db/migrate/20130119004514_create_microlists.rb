class CreateMicrolists < ActiveRecord::Migration
  def change
    create_table :microlists do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :microlists, [:user_id, :created_at]
  end
end
