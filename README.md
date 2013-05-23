# OmniAuth Shapeways

This gem contains the Shapeways strategy for OmniAuth.

## How To Use It

Add the strategy to your `Gemfile`:

    gem 'omniauth-shapeways'

Or you can pull it directly from github eg:

    gem 'omniauth-shapeways', :git => 'https://github.com/phy5ics/omniauth-shapeways.git'

For a Rails application you'd now create an initializer `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :shapeways, 'api_key', 'api_secret', :site => 'http://api.shapeways.com' 
    end

For Sinatra you'd add this 4 lines:

    use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :shapeways, 'api_key', 'api_secret', :site => 'http://api.shapeways.com'
    end

You can find the api_key and the api_secret in the developer.shapeways.com site.