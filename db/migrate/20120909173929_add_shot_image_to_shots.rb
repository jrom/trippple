class AddShotImageToShots < ActiveRecord::Migration
  def change
    add_column :shots, :shot_image, :string
  end
end
