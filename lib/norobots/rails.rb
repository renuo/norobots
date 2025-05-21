# frozen_string_literal: true

module Norobots
  class Railtie < Rails::Railtie
    initializer "norobots.configure_rack_middleware" do |app|
      if ENV["BLOCK_ROBOTS"] || ENV["CANONICAL_HOST"]
        app.middleware.insert_before Rack::Sendfile, Norobots::Middleware
      end
    end
  end
end
