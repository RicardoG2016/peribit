class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  searchkick
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  has_many :posts
  has_many :replies
end
