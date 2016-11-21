class Presenter < ActiveRecord::Base
  belongs_to :user
  has_many :contents
  has_many :meta
  has_many :ui_elements
end
