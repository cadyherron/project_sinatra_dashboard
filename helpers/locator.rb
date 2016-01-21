require 'httparty'

class Locator

  include HTTParty
  attr_reader :location_data, :options

  def initialize(ip = '75.101.62.146')  
    # reno 96.38.168.13, sf 75.101.62.146
    @ip = ip
    get_location
  end

  def get_location
    @location_data = self.class.get("http://freegeoip.net/json/#{@ip}")
  end

  def readable_location
    "#{@location_data['city']}, #{@location_data['region_code']}"
  end
end

# freegeoip.net/json/{IP_or_hostname}