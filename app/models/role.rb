class Role < ActiveRecord::Base
  belongs_to :user
  has_one :user
  acts_as_votable 
end
