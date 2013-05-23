# OmniAuth Shapeways

This gem is an OmniAuth 1.0 Strategy for the [Shapeways API](http://developer.shapeways.com/)

It supports the Shapeways API which uses OAuth 1.0a.

## Usage

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-shapeways'
```

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :shapeways, ENV['SHAPEWAYS_CONSUMER_TOKEN'], ENV['SHAPEWAYS_CONSUMER_SECRET']
end
```

In Rails, add this to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shapeways, ENV['SHAPEWAYS_CONSUMER_TOKEN'], ENV['SHAPEWAYS_CONSUMER_SECRET']
end
```

You will have to put in your consumer key and secret.

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

## <a name="build"></a>Build Status
[![Build Status](https://secure.travis-ci.org/phy5ics/omniauth-shapeways.png?branch=master)][travis]

[travis]: http://travis-ci.org/phy5ics/omniauth-shapeways

## <a name="dependencies"></a>Dependency Status
[![Dependency Status](https://gemnasium.com/phy5ics/omniauth-shapeways.png?travis)][gemnasium]

[gemnasium]: https://gemnasium.com/phy5ics/omniauth-shapeways

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 John Barton. See [LICENSE](https://github.com/phy5ics/omniauth-shapeways/blob/master/LICENSE.txt) for details.