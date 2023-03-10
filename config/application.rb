require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAndMandrill
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # SMTP settings for Mandrill
    ActionMailer::Base.smtp_settings = {
      :address                => ENV['SMTP_ADDRESS'],
      :port                   => 587,
      :user_name              => ENV['SMTP_USERNAME'],
      :password               => ENV['SMTP_PASSWORD'],
      :authentication         => 'plain',
      :enable_starttls_auto   => true,
    }
    ActionMailer::Base.delivery_method = :smtp
  end
end
