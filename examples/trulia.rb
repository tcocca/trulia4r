require File.dirname(__FILE__) + '/../lib/trulia4r'

# Firstly Read the Trulia API Docs and register for your API Key
# http://developer.trulia.com/docs

# Initialize a new Trulia client

client = Trulia4r::Client.new('apikey')


# Initialize a new LocationInfo object
# Refer to the API Docs here: http://developer.trulia.com/docs/LocationInfo

loc = Trulia4r::LocationInfo.new(client)

# Available methods on the LocationInfo object

cities = loc.get_cities_in_state('MA')
counties = loc.get_counties_in_state('MA')
neighs = loc.get_neighborhoods_in_city('Boston', 'MA')
states = loc.get_states
zips = loc.get_zip_codes_in_state('MA')


# The following is available to all of the above
if zip.success?
  puts zips.data  # Returns just the data portion of the response
  puts zips.body  # Returns the full body of the response
else
  puts zips.error # Error message for the response
end


# Initialize a new TruliaStats object
# Refer to the API Docs here: http://developer.trulia.com/docs/TruliaStats

stats = Trulia4r::TruliaStats.new(client)

# Available methods on the TruliaStats object
# Each method takes the following optional params:
#   startDate   The first date for which you wish to receive statistics. YYYY-MM-DD (Defaults to last valid day)
#   endDate   The last date for which you wish to receive statistics.    YYYY-MM-DD (Defaults to last valid day)
#   statType  The type of statistic you wish to receive.  Valid types: {"all", "traffic", "listings"} (Defaults to "all")

city_stats = stats.get_city_stats('Boston', 'MA')
county_stats = stats.get_county_stats('Suffolk', 'MA', :startDate => '2008-12-31', :endDate => '2009-01-31')
neigh_stats = stats.get_neighborhood_stats('3448', :statType => "traffic", :startDate => '2008-07-01')
state_stats = stats.get_state_stats('MA', :statType => "listings")
zip_stats = stats.get_zip_code_stats('02213')

if zip_stats.success?
  puts zip_stats.body           # Returns the entire body of the reponse
  puts zip_stats.data           # Returns the full data portion of the response
  puts zip_stats.listing_stats  # Returns only the listings stats
  puts zip_stats.traffic_stats  # Returns only the traffic stats
  puts zip_stats.location       # Returns just the location data
else
  puts zip_stats.error          # Error message for the response
end