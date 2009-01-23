require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/trulia4r'
require File.dirname(__FILE__) + '/../../lib/trulia4r/client'
require File.dirname(__FILE__) + '/../../lib/trulia4r/location_info'

describe Trulia4r::LocationInfo do
  
  before do
    @client = Trulia4r::Client.new('tkgvp2ghwpnp2mphydeyf7fw')
    @location_info = Trulia4r::LocationInfo.new(@client)
  end
    
  describe 'initialize' do
    it 'merges the location info library into the default params' do
      @location_info.default_params.should == {:apikey => 'tkgvp2ghwpnp2mphydeyf7fw', :library => 'LocationInfo'}
    end
  end
  
  describe 'get_cities_in_state' do
    it 'should return cities when given a state' do
      cities = get_cities('MA')
      cities.should be_success
      cities.data.should_not be_blank
    end
    
    it 'should return blank when given an invalid state' do
      cities = get_cities('Boston')
      cities.should_not be_success
      cities.data.should be_blank
    end
    
    it 'should error on blank param' do
      cities = get_cities('')
      cities.should_not be_success
      cities.error.should_not be_blank
    end
    
    def get_cities(param)
      @location_info.get_cities_in_state(param)
    end
  end
  
  describe 'get_counties_in_state' do
    it 'should return counties when given a state' do
      counties = get_counties('MA')
      counties.should be_success
      counties.data.should_not be_blank
    end
    
    it 'should return blank when given an invalid state' do
      counties = get_counties('Boston')
      counties.should_not be_success
      counties.data.should be_blank
    end
    
    it 'should error on blank param' do
      counties = get_counties('')
      counties.should_not be_success
      counties.error.should_not be_blank
    end
    
    def get_counties(param)
      @location_info.get_counties_in_state(param)
    end
  end
  
  describe 'get_neigborhoods_in_city' do
    it 'should return neighbohoods when given a valid city and state' do
      neighborhoods = get_neighs('Boston', 'MA')
      neighborhoods.should be_success
      neighborhoods.data.should_not be_blank
    end
    
    it 'should return blank when given an invalid city' do
      neighborhoods = get_neighs('Beentown', 'MA')
      neighborhoods.should_not be_success
      neighborhoods.data.should be_blank
    end
    
    it 'should return blank when given an invalid state' do
      neighborhoods = get_neighs('Boston', 'HW')
      neighborhoods.should_not be_success
      neighborhoods.data.should be_blank
    end
    
    it 'should return blank when given an invalid city and state combo' do
      neighborhoods = get_neighs('Boston', 'NY')
      neighborhoods.should_not be_success
      neighborhoods.data.should be_blank
    end
    
    it 'should error on blank param' do
      neighborhoods = get_neighs('', 'NY')
      neighborhoods.should_not be_success
      neighborhoods.error.should_not be_blank
    end
    
    def get_neighs(*params)
      @location_info.get_neighborhoods_in_city(*params)
    end
  end
  
  describe 'get_states' do
    it 'should return the states' do
      states = @location_info.get_states
      states.should be_success
      states.data.should_not be_blank
      states.error.should be_blank
    end
  end
  
  describe 'get_zip_codes_in_state' do
    it 'should return zip codes when given a state' do
      zips = get_zips('MA')
      zips.should be_success
      zips.data.should_not be_blank
    end
    
    it 'should return blank when given an invalid state' do
      zips = get_zips('Boston')
      zips.should_not be_success
      zips.data.should be_blank
    end
    
    it 'should error on blank param' do
      zips = get_zips('')
      zips.should_not be_success
      zips.error.should_not be_blank
    end
    
    def get_zips(param)
      @location_info.get_zip_codes_in_state(param)
    end
  end
  
end
