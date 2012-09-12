class AddUserIdToShots < ActiveRecord::Migration
  def change
    add_column :shots, :user_id, :integer
  end
end
