require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/trulia4r'
require File.dirname(__FILE__) + '/../../lib/trulia4r/client'
require File.dirname(__FILE__) + '/../../lib/trulia4r/trulia_stats'

describe Trulia4r::TruliaStats do
  
  before do
    @client = Trulia4r::Client.new('tkgvp2ghwpnp2mphydeyf7fw')
    @trulia_stats = Trulia4r::TruliaStats.new(@client)
  end
  
  describe 'initialize' do
    it 'merges the trulia stats library into the default params' do
      @trulia_stats.default_params.should == {:apikey => 'tkgvp2ghwpnp2mphydeyf7fw', :library => 'TruliaStats'}
    end
  end
  
  describe 'get_city_stats' do
    it 'should return total city stats' do
      stats = city_stats('Boston', 'MA')
      stats.should be_success
    end
    
    it 'should only return listings stats if listings are requested' do
      stats = city_stats('Boston', 'MA', :statType => 'listings')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should be_blank
    end
    
    it 'should only return traffic stats if traffic is requested' do
      stats = city_stats('Boston', 'MA', :statType => 'traffic')
      stats.traffic_stats.should_not be_blank
      stats.listing_stats.should be_blank
    end
    
    it 'should return all stats if all are requested' do
      stats = city_stats('Boston', 'MA', :statType => 'all')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should_not be_blank
    end
    
    it 'should error on invalid params' do
      stats = city_stats('', 'MA')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    it 'should not return results on invalid city and state combo' do
      stats = city_stats('Boston', 'HI')
      stats.should_not be_success
      stats.error.should be_blank
    end
    
    def city_stats(*params)
      @trulia_stats.get_city_stats(*params)
    end
  end
  
  describe 'get_county_stats' do
    it 'should return total county stats' do
      stats = county_stats('Suffolk', 'MA')
      stats.should be_success
    end
    
    it 'should only return listing stats is listings are requested' do
      stats = county_stats('Suffolk', 'MA', :statType => 'listings')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should be_blank
    end
    
    it 'should only return traffic stats if traffic is requested' do
      stats = county_stats('Suffolk', 'MA', :statType => 'traffic')
      stats.traffic_stats.should_not be_blank
      stats.listing_stats.should be_blank
    end
    
    it 'should return all stats if all are requested' do
      stats = county_stats('Suffolk', 'MA', :statType => 'all')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should_not be_blank
    end
    
    it 'should error on invalid params' do
      stats = county_stats('', 'MA')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    it 'should not return results on invalid city and state combo' do
      stats = county_stats('Suffolk', 'HI')
      stats.should_not be_success
      stats.error.should be_blank
    end
    
    def county_stats(*params)
      @trulia_stats.get_county_stats(*params)
    end
  end
  
  describe 'get_neighborhood_stats' do
    it 'should return total neighborhood stats' do
      stats = neighborhood_stats('3448')
      stats.should be_success
    end
    
    it 'should only return listing stats is listings are requested' do
      stats = neighborhood_stats('3448', :statType => 'listings')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should be_blank
    end
    
    it 'should only return traffic stats if traffic is requested' do
      stats = neighborhood_stats('3448', :statType => 'traffic')
      stats.traffic_stats.should_not be_blank
      stats.listing_stats.should be_blank
    end
    
    it 'should return all stats if all are requested' do
      stats = neighborhood_stats('3448', :statType => 'all')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should_not be_blank
    end
    
    it 'should error on invalid param' do
      stats = neighborhood_stats('')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    it 'should not return results on and invalid neighborhood id' do
      stats = neighborhood_stats('1000000')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    def neighborhood_stats(*params)
      @trulia_stats.get_neighborhood_stats(*params)
    end
  end
  
  describe 'get_state_stats' do
    it 'should return total state stats' do
      stats = state_stats('MA')
      stats.should be_success
    end
    
    it 'should only return listing stats is listings are requested' do
      stats = state_stats('MA', :statType => 'listings')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should be_blank
    end
    
    it 'should only return traffic stats if traffic is requested' do
      stats = state_stats('MA', :statType => 'traffic')
      stats.traffic_stats.should_not be_blank
      stats.listing_stats.should be_blank
    end
    
    it 'should return all stats if all are requested' do
      stats = state_stats('MA', :statType => 'all')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should_not be_blank
    end
    
    it 'should error on invalid param' do
      stats = state_stats('')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    it 'should not return results on and invalid state code' do
      stats = state_stats('HW')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    def state_stats(*params)
      @trulia_stats.get_state_stats(*params)
    end
  end
  
  describe 'get_zip_code_stats' do
    it 'should return total zip code stats' do
      stats = zip_code_stats('02215')
      stats.should be_success
    end
    
    it 'should only return listing stats is listings are requested' do
      stats = zip_code_stats('02215', :statType => 'listings')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should be_blank
    end
    
    it 'should only return traffic stats if traffic is requested' do
      stats = zip_code_stats('02215', :statType => 'traffic')
      stats.traffic_stats.should_not be_blank
      stats.listing_stats.should be_blank
    end
    
    it 'should return all stats if all are requested' do
      stats = zip_code_stats('02215', :statType => 'all')
      stats.listing_stats.should_not be_blank
      stats.traffic_stats.should_not be_blank
    end
    
    it 'should error on invalid param' do
      stats = zip_code_stats('')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    it 'should not return results on and invalid zip code' do
      stats = zip_code_stats('99999')
      stats.should_not be_success
      stats.error.should_not be_blank
    end
    
    def zip_code_stats(*params)
      @trulia_stats.get_zip_code_stats(*params)
    end
  end
  
end
