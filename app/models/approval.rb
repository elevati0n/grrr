class Approval < ActiveRecord::Base
  belongs_to :user
  belongs_to :friendship
  belongs_to :subscription
  belongs_to :membership
  has_one :user
end
