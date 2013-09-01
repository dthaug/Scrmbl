# == Schema Information
#
# Table name: listings
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Listing < ActiveRecord::Base
	
  attr_accessible :content, :user_id

  belongs_to :user

  validates :content, :length => { :maximum => 200}

end
