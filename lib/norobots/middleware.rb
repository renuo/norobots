# frozen_string_literal: true

module Norobots
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"] == "/robots.txt"
        [200, {"Content-Type" => "text/plain"}, [robots_txt_content(env)]]
      else
        @app.call(env)
      end
    end

    private

    def robots_txt_content(env)
      if ENV["BLOCK_ROBOTS"].nil? && ENV["CANONICAL_HOST"].nil?
        return @app.call(env)[2].first
      end

      if ENV["CANONICAL_HOST"]
        request_host = env["HTTP_HOST"]
        canonical_host = ENV["CANONICAL_HOST"]
        if request_host == canonical_host
          @app.call(env)[2].first
        else
          "User-Agent: *\nDisallow: /"
        end
      else
        "User-Agent: *\nDisallow: /"
      end
    end
  end
end
