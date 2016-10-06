require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleChat
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.sass.preferred_syntax = :sass

    config.generators do |g|
      g.assets = false
      g.helper = false
      g.skip_routes = true
    end

    config.action_cable.mount_path = '/cable'
    config.action_cable.disable_request_forgery_protection = true
  end
end
