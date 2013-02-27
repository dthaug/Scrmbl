class CreateScrambles < ActiveRecord::Migration
  def change
     create_table :scrambles do |t|
      t.string :content
      t.integer :business_id

      t.timestamps
    end
    add_index :scramble, [:business_id, :created_at]
  end
end
