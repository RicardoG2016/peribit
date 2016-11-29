class Post < ApplicationRecord 
  include SimpleHashtag::Hashtaggable
  belongs_to :user
  acts_as_likeable
  acts_as_mentioner
  has_many :replies

  scope :trending, -> { order("delete_at ASC").limit(10) }

  validates :body, presence: true, length: { minimum: 1, maximum: 140 }
end
