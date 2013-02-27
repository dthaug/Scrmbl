class Scramble < ActiveRecord::Base

  attr_accessible :content
  belongs_to :business

  validates :business_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'scramble.created_at DESC'

  def self.from_businesses_followed_by(business)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_business_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end


end
