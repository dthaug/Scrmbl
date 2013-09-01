class Scramble < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :description, :price, :title, :image, :item_count

  belongs_to :user

  has_many :milestones, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => :true

  validates :description, :price, :title, presence: true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, presence: true, :numericality => {:greater_than => 0}
  #validates :availableItems, :format => { :with => /^\d+??/ }, presence: true, :numericality => {:greater_than => 0}

  # validates_attachment :image, presence: true,
  #                           content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  #                           size: { less_than: 5.megabytes }
  has_attached_file :image, styles: { medium: "400x400>",
                                      small:  "200x200#"}
=======

  attr_accessible :content, :title
  belongs_to :business

  validates :business_id, presence: true
  validates :content, presence: true, length: { minimum: 140 }

  default_scope order: 'scramble.created_at DESC'

  def self.from_businesses_followed_by(business)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_business_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

>>>>>>> 5cd8ed10911b1e37a98f0635ad6202893d2ab629

end
