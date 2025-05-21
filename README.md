# Norobots

[![Gem Version](https://badge.fury.io/rb/norobots.svg)](https://badge.fury.io/rb/norobots)
[![Build Status](https://travis-ci.org/renuo/norobots.svg?branch=master)](https://travis-ci.org/renuo/norobots)
[![Maintainability](https://api.codeclimate.com/v1/badges/8f0d93fa0d0aecc83797/maintainability)](https://codeclimate.com/github/renuo/norobots/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8f0d93fa0d0aecc83797/test_coverage)](https://codeclimate.com/github/renuo/norobots/test_coverage)

Block Bots from accessing your website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'norobots'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install norobots

## Usage
The middleware can be configured using environment variables. You can use either `BLOCK_ROBOTS` or `CANONICAL_HOST`, but not both.

If you use Rails the middleware is loaded automatically.

### Configuration Options

1. No environment variables set:
   - The original `robots.txt` file from your public folder will be served

2. Only `BLOCK_ROBOTS` set:
   - All domains will be blocked (Disallow: /)

3. Only `CANONICAL_HOST` set:
   - The canonical domain will be crawlable (Allow: /)
   - All other domains will be blocked (Disallow: /)

Example:
```ruby
# In your Rails application

# Option 1: Block all robots
ENV['BLOCK_ROBOTS'] = 'true'
# Result: All domains will be blocked

# Option 2: Allow only canonical domain
ENV['CANONICAL_HOST'] = 'example.com'
# Result:
# - example.com/robots.txt -> Allows crawling
# - staging.example.com/robots.txt -> Blocks crawling
# - any-other-domain.com/robots.txt -> Blocks crawling

# Option 3: No environment variables
# Result: Your original robots.txt from public folder is served
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renuo/norobots.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Norobots project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/renuo/norobots/blob/master/CODE_OF_CONDUCT.md).
