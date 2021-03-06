require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProTidy
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.api_only = true

    config.middleware.insert_before 0, "Rack::Cors", debug: true, logger: ( -> { Rails.logger }) do
      allow do
          origins '*'

          resource '*',
              :headers => :any,
              :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
              :methods => [:get, :post, :delete, :put, :options],
              :max_age => 0
      end
    end
  end
end

