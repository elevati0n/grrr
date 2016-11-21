class Friendship < ActiveRecord::Base
  belongs_to :user
  has_one :user
  has_one :approval
  has_many :contents
  acts_as_votable 
end
