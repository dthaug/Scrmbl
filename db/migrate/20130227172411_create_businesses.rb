class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :business do |t|
      t.string :name
      t.string :orgnr
      t.string :email

      t.timestamps
    end
  end
end
