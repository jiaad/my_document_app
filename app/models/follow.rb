class Follow < ApplicationRecord
  cattr_accessor :current_user
  # before_create :check_exists
  # attr_accessible :profile_id

	belongs_to :following, foreign_key: 'following_id', class_name: 'User'
  belongs_to :follower, foreign_key: 'user_id', class_name: 'User'
  #Follow.first.follower
  #Follow.first.following
  #https://medium.com/@esmerycornielle/making-a-followers-feature-with-ruby-on-rails-and-active-record-ddb3d1dda060
  def self.check_exists
    @current = Follow.current_user
    @follow = Follow.where(user_id: @current.id)
    # puts "*" * 90
    # puts @current.id
    # puts @follow.all
    #   @follow.each do |f|
    #    puts f.id
    #    puts "following : #{f.following_id}"
    #    puts "user : #{f.user_id}"
    #    puts "========================="
    #   end
    # puts "*" * 90
    @follow.each do |f|
      if !Follow.exists?(user_id: @current.id, following_id: f.following_id)
        puts "following : #{f.following_id}"
        puts "user : #{f.user_id}"
       puts "==========      #{"patpppppppppppppp"}        =============="

      #Follow.update_attributes(user_id: @current.id, following_id: f.following_id)
      # error.add("entrain de tester")
      return false
      end
    end
    return true
  end


  def self.check_record(current , following)
    @current = Follow.current_user
    @follow = Follow.where(user_id: @current.id)
      if Follow.exists?(user_id: current, following_id: following)
        return true
      end
      return false
  end


  # def check_exists
  #   @follow = Follow.find_by_user_id_and_following_id(self.user_id, self.following_id)
  #   @current = Follow.current_user
  #   @follow = Follow.where(user_id: @current.id)
  #   if @follow.present?
  #     puts "*" * 90
  #     puts "mais ca existe "
  #     puts "*" * 90
  #   else 
  #     puts "*" * 90
  #     puts "ombaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  #     puts "*" * 90

  #   end
  # end





    # if self.exists?
    #   flash[:danger]="ca existe"
    #   redirect_to root_path
    # end

end
