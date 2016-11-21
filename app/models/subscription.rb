class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed
  has_one :feed
end
