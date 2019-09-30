class MyMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  
  # def deliver_later
  #   Devise::Mailer.delay(queue: 'my_queue').send(...)
  # end

  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    super
  end
  
  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "Bar"
    opts[:from] = 'abdulziad@hotmail.com'
    opts[:reply_to] = 'abdulziad@hotmail.com'
    super
  end


end