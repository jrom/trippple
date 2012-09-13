class Shot < ActiveRecord::Base
  attr_accessible :title, :shot_image

  mount_uploader :shot_image, ShotImageUploader


  def to_s
    title
  end
end
