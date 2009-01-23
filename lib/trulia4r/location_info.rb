module Trulia4r
  class LocationInfo
    
    attr_accessor :client, :default_params
    
    def initialize(client)
      @client = client
      @default_params = @client.class.default_params.merge({:library => 'LocationInfo'})
    end
    
    def get_cities_in_state(state)
      options = {:function => 'getCitiesInState', :state => state}
      process(options, 'city')
    end
    
    def get_counties_in_state(state)
      options = {:function => 'getCountiesInState', :state => state}
      process(options, 'county')
    end
    
    def get_neighborhoods_in_city(city, state)
      options = {:function => 'getNeighborhoodsInCity', :city => city, :state => state}
      process(options, 'neighborhood')
    end
    
    def get_states
      options = {:function => 'getStates'}
      process(options, 'state')
    end
    
    def get_zip_codes_in_state(state)
      options = {:function => 'getZipCodesInState', :state => state}
      process(options, 'zipCode')
    end
    
    private
    
    def process(options, body_hash)
      Response.new(@client.class.get(@client.api_page, :query => options.merge(@default_params)), body_hash)
    end
    
    class Response
      attr_accessor :body, :body_hash
      
      def initialize(body, body_hash)
        @body = body
        @body_hash = body_hash
      end
      
      def data
        @body['TruliaWebServices']['response']['LocationInfo'][@body_hash]
      end
      
      def error
        @body['TruliaWebServices']['response']['LocationInfo']['error']
      end
      
      def success?
        error.blank? && !data.blank?
      end
      
    end
    
  end
end
