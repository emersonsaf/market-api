require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MarketApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001'    
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end
  end
end
