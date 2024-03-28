require 'httparty'
require 'json'

response = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?postalCode=38133&apikey=VDTFlLpQ5ENiBQVoNSsgij5fTWM1GWxZ")

if response.code == 200
  idk = JSON.parse(response.body)
  for i in 0..1
    current = idk["_embedded"]["events"][i]
    puts "Name: #{current["name"]}, Venue: #{current["_embedded"]["venues"][0]["name"]}, Start time: #{current["dates"]["start"]["localDate"]}, #{current["dates"]["start"]["localTime"]} "
  end
elsif
  puts "error: #{response.code}"
end
