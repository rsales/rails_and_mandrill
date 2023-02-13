require 'MailchimpTransactional'

class WelcomeMailer < ActionMailer::Base
  def welcome_send(user)
    @user = user
    begin
      client = MailchimpTransactional::Client.new(ENV["SMTP_PASSWORD"])
      result =
        client.messages.send_template(
          {
            'template_name' => 'welcome',
            'template_content' => [{}],
            'message' => {
              from_email: "rafael.sales@salescreations.com.br",
              subject: "👋 Welcome to the APP #{ user.name }!",
              to: [
                {
                  email: user.email,
                  name: user.name,
                  type: "to"
                }
              ],
              merge: true,
              global_merge_vars: [
                { 
                  name: 'fname', 
                  content: user.name 
                }
              ]
            }
          }
        )
      p result
    rescue MailchimpTransactional::ApiError => e
      puts "Error: #{e}"
    end
  end

  # def welcome_send(user)
  #   @user = user
  #   mail(
  #     to: user.email,
  #     from: "rafael.sales@salescreations.com.br",
  #     subject: "Welcome to the APP #{ user.name }!"
  #   )
  # end
end



