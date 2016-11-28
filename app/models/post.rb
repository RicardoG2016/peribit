class Post < ApplicationRecord 
  include SimpleHashtag::Hashtaggable
  belongs_to :user
  acts_as_likeable
  acts_as_mentioner
  has_many :replies
end
