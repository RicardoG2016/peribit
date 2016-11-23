class Post < ApplicationRecord 
  include SimpleHashtag::Hashtaggable
  belongs_to :user
  acts_as_likeable
end
