class RemoveLatitudeAndLongitudeToUser < ActiveRecord::Migration
  def change
    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
  end
end
