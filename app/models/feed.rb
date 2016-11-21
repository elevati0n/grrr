class Feed < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  belongs_to :subscription
  has_many :posts
  has_many :networks
end
