class Shot < ActiveRecord::Base
  attr_accessible :title, :shot_image

  mount_uploader :shot_image, ShotImageUploader

  scope :ordered_by_likes, order("likes DESC")

  def to_s
    title
  end
end
