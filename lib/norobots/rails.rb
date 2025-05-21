# frozen_string_literal: true

module Norobots
  class Railtie < Rails::Railtie
    initializer "norobots.configure_rack_middleware" do |app|
      app.middleware.insert_before Rack::Sendfile, Norobots::Middleware if ENV["BLOCK_ROBOTS"] || ENV["CANONICAL_HOST"]
    end
  end
end
