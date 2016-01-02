class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.string :user_name
      t.text :message
      t.integer :challenge_id

      t.timestamps null: false
    end
  end
end
