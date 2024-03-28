require 'httparty'
require 'json'


def print_exchange_rate(num)
  response = HTTParty.get("https://v6.exchangerate-api.com/v6/b6e4039990b263ab7b327619/latest/USD")

  if response.code == 200
    dictionary = JSON.parse(response.body)
    exchange_rate = dictionary["conversion_rates"]["KRW"]

    puts "#{num} US dollars is currently equal to #{(num * exchange_rate).round()} South Korean Won."

  elsif
    puts "error: #{response.code}"
  end
end

print_exchange_rate(100)
