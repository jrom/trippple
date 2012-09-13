class Shot < ActiveRecord::Base
  attr_accessible :title

  def to_s
    title
  end
end
