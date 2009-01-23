module Trulia4r
  class Client
    
    attr_accessor :api_page
    include HTTParty
    base_uri 'api.trulia.com'
    format :xml
    
    def initialize(tapikey)
      self.class.default_params :apikey => tapikey
      @api_page = '/webservices.php'
    end
    
  end
end
