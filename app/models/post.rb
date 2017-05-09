class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments
end
