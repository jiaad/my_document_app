class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true
  validates :pseudo, presence: true
  validates :role, presence: true





  extend FriendlyId
  friendly_id :pseudo, use:Module.new {
    def should_generate_new_friendly_id?
      slug.blank? || super
    end
  }


  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :comments, :through => :posts

  def set_default_role
    self.role ||= :user
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, #:confirmable
  has_many :posts, dependent: :destroy


#=================== FOLLOWERS ============================
has_many :follows

has_many :follower_relationships , foreign_key: :following_id, class_name: 'Follow'
has_many :followers, through: :follower_relationships, source: :follower

has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
has_many :followings, through: :following_relationships, source: :following

#======================== END ==============================


  def after_confirmation
      UserMailer.welcome_email(self).deliver #if self.confirmed_at_changed?
  end




  private
  # def validate_email


  #   self.email_confirmed = true
  #   self.cofirm_token = nil
  # end

  # def set_confirmation_token
  #     if self.confirm_token.blank?
  #       self.cofirm_token = SecureRandom.urlsafe_base64.to_s
  #     end
  #   end


  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
