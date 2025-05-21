# frozen_string_literal: true

require "norobots/middleware"

RSpec.describe Norobots::Middleware do
  let(:app) { double("app", call: [200, {"Content-Type" => "html"}, ["Original request"]]) }
  let(:fullpath) { "/test" }
  let(:path_info) { "/robots.txt" }
  let(:default_env_args) { {"PATH_INFO" => path_info} }

  let(:env_args) { default_env_args }
  let(:built_http_canonical_header) { "<http://#{canonical_host}/test>; rel=\"canonical\"" }
  let(:built_https_canonical_header) { "<https://#{canonical_host}/test>; rel=\"canonical\"" }

  subject { described_class.new(app).call(env_args)[2] }

  context "when no environment variables are set" do
    before do
      allow(ENV).to receive(:[]).with("BLOCK_ROBOTS").and_return(nil)
      allow(ENV).to receive(:[]).with("CANONICAL_HOST").and_return(nil)
    end

    it "passes through to the app" do
      expect(subject).to eq ["Original request"]
      expect(app).to have_received :call
    end
  end

  context "when only BLOCK_ROBOTS is set" do
    before do
      allow(ENV).to receive(:[]).with("BLOCK_ROBOTS").and_return(true)
      allow(ENV).to receive(:[]).with("CANONICAL_HOST").and_return(nil)
    end

    it "shows the default robots.txt content" do
      expect(subject).to eq ["User-Agent: *\nDisallow: /"]
      expect(app).not_to have_received :call
    end
  end

  context "when only CANONICAL_HOST is set" do
    let(:canonical_host) { "example.com" }

    before do
      allow(ENV).to receive(:[]).with("BLOCK_ROBOTS").and_return(nil)
      allow(ENV).to receive(:[]).with("CANONICAL_HOST").and_return(canonical_host)
    end

    context "when request is from canonical host" do
      let(:env_args) { default_env_args.merge("HTTP_HOST" => canonical_host) }

      it "uses the original robots.txt" do
        expect(subject).to eq ["Original request"]
        expect(app).to have_received :call
      end
    end

    context "when request is from non-canonical host" do
      let(:env_args) { default_env_args.merge("HTTP_HOST" => "staging.example.com") }

      it "disallows crawling" do
        expect(subject).to eq ["User-Agent: *\nDisallow: /"]
        expect(app).not_to have_received :call
      end
    end
  end

  context "when the request is not for robots.txt" do
    let(:path_info) { "give_me_resources" }

    it("does not do anything") { expect(subject).to eq ["Original request"] }
  end
end
