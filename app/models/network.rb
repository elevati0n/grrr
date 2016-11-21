class Network < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :feeds
  has_many :memberships
  acts_as_votable 
end
