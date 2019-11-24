class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments , dependent: :destroy
  
  validates :description, presence: {message: "description must be given"}
  validates :images, presence: {message: "image must be given"}
  scope :followed_users_posts, -> (follower_id){where(user_id: follower_id )}
end