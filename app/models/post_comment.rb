class PostComment < ApplicationRecord
  # belongs_to :users , :through => :posts
  belongs_to :post #, :through => :users
  validates :body, presence: true
end