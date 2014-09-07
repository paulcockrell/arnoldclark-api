require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ArnoldclarkApi
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("lib")

    config.middleware.insert_before "ActionDispatch::Static", "Rack::Cors", :debug => true, :logger => Rails.logger do
      allow do
        origins '*'

        resource '/api/v1/images',
          :headers => :any,
          :methods => [:get],
          :credentials => true,
          :max_age => 0
      end
    end
  end
end
