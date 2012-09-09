class AddLikesToShots < ActiveRecord::Migration
  def change
    add_column :shots, :likes, :integer
  end
end
