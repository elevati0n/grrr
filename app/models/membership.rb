class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  has_one :network
  has_one :approval
end
