class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :presenter
  belongs_to :friendship
  has_many :meta
  has_many :presenters
  has_many :posts
end
