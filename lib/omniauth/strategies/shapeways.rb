require 'multi_json'

require 'omniauth-oauth2'
require 'rack/utils'

module OmniAuth
  module Strategies
    class Shapeways < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'shapeways'

      option :client_options, {
        :grant_type => 'client_credentials',
        :site => 'http://api.shapeways.com',
        :request_token_url => 'https://api.shapeways.com/oauth2/token'
      }

      uid{ 'banana' }

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

      #def authorize_params
      #  super.merge(foo_param: request.params["foo_param"], bar_param: request.params["bar_param"])
      #end

      #def raw_info
      #  @raw_info ||= MultiJson.decode(access_token.get('/api/v1/').body)
      #end

      def raw_info
        @raw_info ||= access_token.get('/api/v1').parsed
      end
    end
  end
end
