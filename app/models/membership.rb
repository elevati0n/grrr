class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  has_one :network
end
