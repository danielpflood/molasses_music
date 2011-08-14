class Project < ActiveRecord::Base
  attr_accessible :name, :project_type
  belongs_to :user
  
  validates :name, :presence => true, :length => { :maximum => 25 }
  validates :project_type, :presence => true, :length => { :maximum => 10 }
  validates :user_id, :presence => true
    
    
  default_scope :order => 'projects.created_at DESC'
end
