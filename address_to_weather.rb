require 'open-uri'
require 'json'
# Setup and input
	puts "Let's get the weather forecast for your address."

	puts "What is the address you would like to know the weather for?"
	the_address = gets.chomp
	url_safe_address = URI.encode(the_address)

# First find lat & long

	# Get the URL
		url_of_data_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}&sensor=false"
		raw_data = open(url_of_data_we_want).read

		parsed_data = JSON.parse(raw_data)
		results = parsed_data["results"]

		first = results[0]
		geometry = first["geometry"]
	
	# Lattitude and longitude
		the_latitude = (geometry["location"]["lat"]*1000).round / 1000.0
		the_longitude = (geometry["location"]["lng"]*1000).round / 1000.0

# Now look up the weather at the lat-long
	# Create a new URL
		weather_URL = "https://api.forecast.io/forecast/48fc563a00174884d3e75edc1cb3ddad/#{the_latitude},#{the_longitude}"

		weather_data = open(weather_URL).read

		parsed_weather_data = JSON.parse(weather_data)

	# Find the correct values
		the_temperature = parsed_weather_data["currently"]["temperature"]

		the_hour_outlook = parsed_weather_data["minutely"]["summary"]

		the_day_outlook = parsed_weather_data["hourly"]["summary"]
	
	# Output
		puts "The current temperature at #{the_address} is #{the_temperature} degrees."
		puts "The outlook for the next hour is: #{the_hour_outlook}"
		puts "The outlook for the next day is: #{the_day_outlook}"
