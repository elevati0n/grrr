class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login
  
  #->Prelang (user_login:devise/username_login_support)
  has_many :networks
  has_many :posts
  has_many :feeds
  belongs_to :friendship
  belongs_to :role
  belongs_to :presenter
  has_many :memberships
  has_many :presenters
  has_many :friendships
  has_many :subscriptions
  has_many :roles
  has_many :contents
  has_many :meta
  belongs_to :approval
  belongs_to :network
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end


  devise authentication_keys: [:login]
  acts_as_votable 
end
