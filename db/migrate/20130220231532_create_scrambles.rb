class CreateScrambles < ActiveRecord::Migration
  def change
     create_table :scrambles do |t|
      t.text :content
      t.string :title
      t.string :image_url
      t.integer :business_id

      t.timestamps

  end
end
end
