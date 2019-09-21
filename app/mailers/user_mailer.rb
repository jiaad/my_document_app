class UserMailer < ApplicationMailer

  default from: 'abdulziad@hotmail.com'
  def welcome_email(user)
    #@lol = params[:user]
    @user = user
    mail(to: @user.email, 
      subject: 'Welcome to My Awesome Site',
      delivery_method_options: { api_key: ENV['PUBLIC_MAILJET'], secret_key: ENV['SECRET_MAILJET'], version: 'v3.1'}
    )


    puts "============================================"
      puts @user.email
     # puts @lol
    puts "============================================"
  end

end
