class Presenter < ActiveRecord::Base
  belongs_to :user
  has_many :contents
  has_many :meta
end
