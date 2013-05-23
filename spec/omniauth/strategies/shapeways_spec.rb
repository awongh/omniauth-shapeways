require 'spec_helper'

describe OmniAuth::Strategies::Shapeways do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Shapeways.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct Shapeways site' do
      subject.options.client_options.site.should eq('http://api.shapeways.com')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://api.shapeways.com/login')
    end

    it 'has correct request token url' do
      subject.options.client_options.request_token_url.should eq('http://api.shapeways.com/oauth1/request_token/v1')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_url.should eq('http://api.shapeways.com/oauth1/access_token/v1')
    end
  end
  
  describe '#request_phase' do
    it 'should redirect to an authorization page on Shapeways' do
      pending 'I have no idea how to implement this test properly'
    end
  end
  
  describe '#info' do
    before :each do
      @raw_info ||= { 'info' => { 'result' => 'success', 'name' => 'nil'} }
      subject.stub(:raw_info) { @raw_info }
    end

    context 'when data is present in the raw info' do
      it 'returns the name' do
        subject.info[:info]['name'].should eq('nil')
      end

      it 'returns the result' do
        subject.info[:info]['result'].should eq('success')
      end
    end
  end

  describe '#extra' do
    before :each do
      @raw_info_hash = { "extra" => [] }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end