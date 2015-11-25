class DropProfilTable < ActiveRecord::Migration
  def change
     drop_table :profiles
  end
end
