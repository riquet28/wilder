class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag, :string
    add_column :users, :description, :text
    add_column :users, :adresse, :string
    add_column :users, :telephone, :string
    add_column :users, :langage, :string
    add_column :users, :competence, :string
  end
end
