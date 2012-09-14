class Shot < ActiveRecord::Base
  attr_accessible :title, :shot_image

  mount_uploader :shot_image, ShotImageUploader

  scope :ordered_by_likes, order("likes DESC")

  validates_presence_of :title, :shot_image, :user

  belongs_to :user

  def to_s
    title
  end
end
