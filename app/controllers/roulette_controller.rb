class RouletteController < ApplicationController

	def increase
		ruleta = Roulette.first
		last_increase = ruleta.last_increase
		if last_increase.utc < (Time.now - 24.hours).utc
			ruleta.last_increase = Time.now
			ruleta.save
			jugadores = Player.where(active:true)
			jugadores.each do |j|
				Player.increase_balance(j, 10000)
			end
		end
	end
end
