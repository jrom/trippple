class AddLikesToShots < ActiveRecord::Migration
  def change
    add_column :shots, :likes, :integer, :default => 0
  end
end
