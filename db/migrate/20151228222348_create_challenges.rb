class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.datetime :expires_at
      t.integer :points

      t.timestamps null: false
    end
  end
end
