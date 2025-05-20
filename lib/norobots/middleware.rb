# frozen_string_literal: true

module Norobots
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"] == "/robots.txt" && !ENV["BLOCK_ROBOTS"].nil?
        [200, {"Content-Type" => "text/plain"}, ["User-Agent: *\nDisallow: /"]]
      else
        @app.call(env)
      end
    end
  end
end
