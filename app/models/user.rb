class User < ApplicationRecord

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :comments, :through => :posts

  def set_default_role
    self.role ||= :user
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy

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
end
