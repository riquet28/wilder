class AddColumnToOffre < ActiveRecord::Migration
  def change
    add_column :offres, :language, :string
  end
end
