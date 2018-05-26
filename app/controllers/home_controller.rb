class HomeController < ApplicationController
  require 'open-uri'
  require 'json'

  def index
    @rows = Array.new

    for i in 1..5 
      url = "http://openapi.seoul.go.kr:8088/"+ENV["seoul_api_key"]+"/json/SearchPublicToiletPOIService/#{i*1000 - 999}/#{i*1000}/"
      doc = JSON.load(open(url))

      @rows += doc["SearchPublicToiletPOIService"]["row"]
    end

  end
end
