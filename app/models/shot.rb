class Shot < ActiveRecord::Base
  mount_uploader :shot_image, ShotImageUploader

  belongs_to :user

  attr_accessible :title, :shot_image

  scope :likes_ordered, order("likes DESC")
end
