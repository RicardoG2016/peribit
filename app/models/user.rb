class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :capitalize_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  has_many :posts
  has_many :replies

  private
  def capitalize_name
    new_name = self.fullname.split
    new_name.each { |a| a.capitalize! }
    self.fullname = new_name.join(' ')
  end
end
