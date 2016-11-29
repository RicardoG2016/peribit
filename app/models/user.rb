class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { large: "300x300#", medium: "150x150#", thumb: "75x75#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  has_many :posts
  has_many :replies
end
