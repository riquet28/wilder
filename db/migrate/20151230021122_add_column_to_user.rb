class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, default: 0
  end
end
