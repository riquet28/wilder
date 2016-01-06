class RemoveColumnToParticipations < ActiveRecord::Migration
  def change
    remove_column :participations, :user_name, :string
  end
end
