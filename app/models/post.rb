class Post < ApplicationRecord
  belongs_to :user
  validates :description, presence: {message: "must be given"}
  has_many_attached :images
end
