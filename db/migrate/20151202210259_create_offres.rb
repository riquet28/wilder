class CreateOffres < ActiveRecord::Migration
  def change
    create_table :offres do |t|
      t.integer :user_id
      t.string :url
      t.string :type
      t.string :localisation
      t.integer :salaire

      t.timestamps null: false
    end
  end
end
