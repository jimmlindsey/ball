class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments
  
  validates :title, presence: true, length: { maximum: 70}
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
