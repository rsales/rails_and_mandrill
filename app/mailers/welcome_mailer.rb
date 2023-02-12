class WelcomeMailer < ActionMailer::Base
  def welcome_send(user)
    @user = user
    mail(
      to: user.email,
      from: "rafael.sales@salescreations.com.br",
      subject: "Welcome to the APP #{ user.name }!"
    )
  end
end