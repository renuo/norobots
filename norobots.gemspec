# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norobots/version'

Gem::Specification.new do |spec|
  spec.name          = 'norobots'
  spec.version       = Norobots::VERSION
  spec.authors       = ['Alessandro Rodi']
  spec.email         = ['alessandro.rodi@renuo.ch']

  spec.summary       = 'A rack middleware to block robots on staging environments.'
  spec.description   = 'A rack middleware that blocks all bots when BLOCK_ROBOTS environment variable is set to true.'
  spec.homepage      = 'https://github.com/renuo/norobots'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
