class AddColumnToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :user_id, :integer
  end
end
