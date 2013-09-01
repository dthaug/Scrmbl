<<<<<<< HEAD
class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, #:recoverable
        :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :description


  has_attached_file :avatar,  :styles => {
									      :thumb => "30x30#",
									      :small  => "70x70>",
									      :medium => "400x300" }

  has_many :scrambles, :dependent => :destroy
=======
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def feed
    Scrambles.from_businesses_followed_by(self)
  end

   def following?(business)
    relationships.find_by_followed_id(business.id)
  end

  def follow!(business)
    relationships.create!(followed_id: business.id)
  end

  def unfollow!(business)
    relationships.find_by_followed_id(business.id).destroy
  end

private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
end


>>>>>>> 5cd8ed10911b1e37a98f0635ad6202893d2ab629
  
end
