class MyMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    MyMailer.confirmation_instructions(User.first, "faketoken", {})
  end

  def reset_password_instructions
    MyMailer.reset_password_instructions(User.first, "faketoken", {})
  end

  def unlock_instructions
    MyMailer.unlock_instructions(User.first, "faketoken", {})
  end
end