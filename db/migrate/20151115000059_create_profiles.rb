class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :user_id
      t.string :tagline
      t.text :introduction
      t.attachment :avatar
    end
  end
end
