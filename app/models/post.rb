class Post < ApplicationRecord 
  include SimpleHashtag::Hashtaggable
  belongs_to :user
  acts_as_likeable
  acts_as_mentioner
  has_many :replies
  scope :trending, -> { order("delete_at ASC").limit(10) }
  has_attached_file :image, :styles => { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :body, presence: true, length: { maximum: 140 }
end
