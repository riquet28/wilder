class AddLastPingAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_ping_at, :datetime
  end
end
