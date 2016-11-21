class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :presenter
  belongs_to :friendship
end
