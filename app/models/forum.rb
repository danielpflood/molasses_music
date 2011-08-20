class Forum < ActiveRecord::Base
  attr_accessible :title
  validates :title, :presence => true, :length => {:maximum => 100}
  has_many :posts
  default_scope :order => 'forums.created_at DESC'
end
