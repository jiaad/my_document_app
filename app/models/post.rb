class Post < ApplicationRecord
  belongs_to :user
  validates :description, presence: {message: "description must be given"}
  has_many_attached :images
  has_many :comments #, :through => :user
end
