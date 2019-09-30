class User < ApplicationRecord

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # after_save :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def after_confirmation
      UserMailer.welcome_email(self).deliver #if self.confirmed_at_changed?
  end

  def after_sign_in_path_for(resource_or_scope)
    flash[:modal] = '#login-message-modal'
    root_url
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
