module Trulia4r
  class TruliaStats
    
    attr_accessor :client, :default_params
    
    def initialize(client)
      @client = client
      @default_params = @client.class.default_params.merge({:library => 'TruliaStats'})
    end
    
    def get_city_stats(city, state, optional = {})
      options = {:function => 'getCityStats', :city => city, :state => state}
      process(options, optional)
    end
    
    def get_county_stats(county, state, optional = {})
      options = {:function => 'getCountyStats', :county => county, :state => state}
      process(options, optional)
    end
    
    def get_neighborhood_stats(neighborhood_id, optional = {})
      options = {:function => 'getNeighborhoodStats', :neighborhoodId => neighborhood_id}
      process(options, optional)
    end
    
    def get_state_stats(state, optional = {})
      options = {:function => 'getStateStats', :state => state}
      process(options, optional)
    end
    
    def get_zip_code_stats(zip_code, optional = {})
      options = {:function => 'getZipCodeStats', :zipCode => zip_code}
      process(options, optional)
    end
  
    private
    
    def process(options, optional)
      options.merge!(optional) unless optional.blank?
      Response.new(@client.class.get(@client.api_page, :query => options.merge(@default_params)))
    end
    
    class Response
      attr_accessor :body, :data, :error
      
      def initialize(body)
        @body = body
        process_data
      end
      
      def listing_stats
        @data['listingStats']
      end
      
      def traffic_stats
        @data['trafficStats']
      end
      
      def location
        @data['location']
      end
      
      def success?
        @error.blank? && !self.listing_stats.blank? && !self.traffic_stats.blank?
      end
      
      private
      
      def process_data
        @data = @body['TruliaWebServices']['response']['TruliaStats']
        @error = @data['error']
      end
      
    end
    
  end
end
