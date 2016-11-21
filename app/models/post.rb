class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed
  belongs_to :network
  has_many :contents
  has_many :presenters
  has_many :networks
  has_many :feeds
end
