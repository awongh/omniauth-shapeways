require 'multi_json'
require 'omniauth-oauth'
require 'rack/utils'

module OmniAuth
  module Strategies
    class Shapeways < OmniAuth::Strategies::OAuth
      option :name, 'shapeways'
      
      option :client_options, {
        :signature_method => 'HMAC-SHA1',
        :site => 'http://api.shapeways.com',
        :authorize_url => 'http://api.shapeways.com/login',
        :request_token_url => 'http://api.shapeways.com/oauth1/request_token/v1',
        :access_token_url => 'http://api.shapeways.com/oauth1/access_token/v1'
      }
      
      def request_phase
        request_token = consumer.get_request_token(:oauth_callback => callback_url)
        
        # Shapeways seems to have a way of providing the token that does not play nicely with the underlying oauth gem.
        # I think that normally the token is provided in the body instead of as a query string parameter.
        # As a result, we need parse it out of the query string provided by Shapeways:
        q = Rack::Utils.parse_query URI(request_token.params['authentication_url']).query
        request_token.token = q['oauth_token']
        
        session['oauth'] ||= {}
        session['oauth'][name.to_s] = {'callback_confirmed' => request_token.callback_confirmed?, 'request_token' => q['oauth_token'], 'request_secret' => request_token.secret}

        if request_token.callback_confirmed?
          redirect request_token.authorize_url(options[:authorize_params].merge(:oauth_consumer_key => consumer.key))
        else
          redirect request_token.authorize_url(options[:authorize_params].merge(:oauth_callback => callback_url, :oauth_consumer_key => consumer.key))
        end

        rescue ::Timeout::Error => e
          fail!(:timeout, e)
        rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
          fail!(:service_unavailable, e)
      end

      info do
        {
          :info => raw_info['info']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/api/v1/').body)
      end

    end
  end
end