class Project < ActiveRecord::Base
  attr_accessible :name, :project_type
  belongs_to :user
  
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates :project_type, :presence => true, :length => { :maximum => 10 }
  validates :user_id, :presence => true
    
    
  default_scope :order => 'projects.created_at DESC'

    # Return projects from the users being followed by the given user.
    scope :from_users_followed_by, lambda { |user| followed_by(user) }

    private

      # Return an SQL condition for users followed by the given user.
      # We include the user's own id as well.
      def self.followed_by(user)
        following_ids = %(SELECT followed_id FROM relationships
                          WHERE follower_id = :user_id)
        where("user_id IN (#{following_ids}) OR user_id = :user_id",
              { :user_id => user })
      end
end
