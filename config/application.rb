require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CityWatch
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.web_console.development_only = false
 	 config.action_controller.action_on_unpermitted_parameters = :raise 
  end
end
