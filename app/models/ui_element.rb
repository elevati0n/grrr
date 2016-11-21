class UiElement < ActiveRecord::Base
  belongs_to :user
  belongs_to :presenter
  belongs_to :content
  has_one :presenter
  acts_as_votable 
end
