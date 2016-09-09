#Modelo que se conecta con la API weatherman
class Weather2 < ApplicationRecord

	require 'rubygems'
	require 'weather-api'

	def self.get_forecast
		response = getYahooForecast
		#response.each do |r|
		#	puts "Cada dia" << r.inspect
		#end
	end

	def self.forecast_rain
		lluvia = false
		response = getYahooForecast
		response.each do |r|
			code = r.code.to_i
			if (code >=0 and code <= 18) or (code >=37 and code <= 47)
				lluvia = true
			end
		end
		return lluvia
	end

	private
	def self.getYahooForecast
		set_link
	  	ruta = URI.parse(@link)
		#hash = "GET"
		#auth_header = { 'Authorization' => "INTEGRACION grupo4:"+hash.to_s,  'Content-Type' => "application/json"}
		#query = { d: "select wind from weather.forecast where woeid=2460286"}
		#respuesta = HTTParty.get(ruta, :query => query)	
	  	#respuesta = HTTParty.get(ruta)	
	  	respuesta = Weather.lookup(9830, Weather::Units::CELSIUS)  	
	  	#puts "Respuesta Forecast JSON: " + respuesta.parsed_response['query']['results']['channel']['item']['forecast'].inspect
	  	#client = Weatherman::Client.new
		#respuesta = client.lookup_by_woeid 455821
	  	puts "RESPUESTA -> " << respuesta.forecasts.inspect
	  	respuesta.forecasts
	end

	def self.set_link
		#@link = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D"santiago%2C%20ak")&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'
		@link = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20=349859%20&format=json"
	end


end
