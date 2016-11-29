class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :capitalize_name
  searchkick
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
  validates :username, presence: true
  validates :fullname, presence: true
  private
  def capitalize_name
    new_name = self.fullname.split
    new_name.each { |a| a.capitalize! }
    self.fullname = new_name.join(' ')
  end
end
