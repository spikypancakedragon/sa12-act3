require 'httparty'
require 'json'

response = HTTParty.get('http://api.weatherapi.com/v1/history.json?q=38133&dt=2024-03-26&key= b1f7372db07c43cfbee23040242803')

if response.code == 200
  dictionary = JSON.parse(response.body)
  sum = 0
  for i in 0..23
    sum += dictionary["forecast"]["forecastday"][0]["hour"][i]["temp_f"]
  end
  avg = sum / 24
  puts "Average temperature for 2024-03-26: #{avg.round(2)}F"
elsif
  puts "error: #{response.code}"
end
