require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Now look up the weather at the lat-long
	# Create a new URL
		weather_URL = "https://api.forecast.io/forecast/48fc563a00174884d3e75edc1cb3ddad/#{the_latitude},#{the_longitude}"

		weather_data = open(weather_URL).read

		parsed_weather_data = JSON.parse(weather_data)

	# Find the correct values
		the_temperature = parsed_weather_data["currently"]["temperature"]

		the_hour_outlook = parsed_weather_data["minutely"]["summary"]

		the_day_outlook = parsed_weather_data["hourly"]["summary"]
	
# Ultimately, we want the following line to work when uncommented:

# puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
# puts "The outlook for the next hour is: #{the_hour_outlook}"
# puts "The outlook for the next day is: #{the_day_outlook}"
