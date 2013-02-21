class CreateScrambles < ActiveRecord::Migration
  def change
    create_table :scrambles do |t|

      t.timestamps
    end
  end
end
