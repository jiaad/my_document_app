class Follow < ApplicationRecord
	belongs_to :following, foreign_key: 'following_id', class_name: 'User'
  belongs_to :follower, foreign_key: 'user_id', class_name: 'User'
  #Follow.first.follower
  #Follow.first.following
  #https://medium.com/@esmerycornielle/making-a-followers-feature-with-ruby-on-rails-and-active-record-ddb3d1dda060
end
