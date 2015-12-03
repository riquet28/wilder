class RenameColumnInOffre < ActiveRecord::Migration
  def change
    rename_column :offres, :type, :contrat
  end
end
