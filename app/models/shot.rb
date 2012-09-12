class Shot < ActiveRecord::Base
  mount_uploader :shot_image, ShotImageUploader

  belongs_to :user

  validates_presence_of :user, :title, :shot_image
  validates_length_of :title, :minimum => 4

  attr_accessible :title, :shot_image

  scope :likes_ordered, order("likes DESC")
end
