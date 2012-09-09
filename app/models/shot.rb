class Shot < ActiveRecord::Base
  mount_uploader :shot_image, ShotImageUploader

  attr_accessible :title, :shot_image
end
