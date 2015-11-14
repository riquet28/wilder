class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prenom, :string
    add_column :users, :birthday, :date
  end
end
