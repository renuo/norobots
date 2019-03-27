# frozen_string_literal: true

module Norobots
  class Railtie < Rails::Railtie
    initializer 'norobots.configure_rack_middleware' do |app|
      puts 'inserting middleware'
      app.middleware.insert_before Rack::Sendfile, Norobots::Middleware unless ENV['BLOCK_ROBOTS'].nil?
    end
  end
end
