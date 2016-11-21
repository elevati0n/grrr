class Meta < ActiveRecord::Base
  belongs_to :content
  belongs_to :user
  belongs_to :approval
  belongs_to :post
  belongs_to :feed
  belongs_to :presenter
  belongs_to :friendship
end
