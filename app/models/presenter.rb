class Presenter < ActiveRecord::Base
  belongs_to :user
  has_many :contents
end
