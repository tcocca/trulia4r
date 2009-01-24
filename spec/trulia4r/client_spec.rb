require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/trulia4r'
require File.dirname(__FILE__) + '/../../lib/trulia4r/client'

describe Trulia4r::Client do
  
  describe 'initialize' do
    before do
      @client = Trulia4r::Client.new('tkgvp2ghwpnp2mphydeyf7fw')
    end
    
    it 'sets the base_uri' do 
      @client.class.base_uri.should == 'http://api.trulia.com'
    end
    
    it 'sets the web services page' do
      @client.api_page.should == '/webservices.php'
    end
    
    it 'sets default params to include the api key' do
      @client.class.default_params.should == {:apikey => 'tkgvp2ghwpnp2mphydeyf7fw'}
    end
  end
  
end
