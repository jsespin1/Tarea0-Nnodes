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

	def new_round
		ruleta = Roulette.first
		last_round = ruleta.last_round
		if last_round.utc < (Time.now - 3.seconds).utc
			ruleta.last_round = Time.now
			ruleta.save
			Roulette.new_round
		end
		path = request.host
		puts "PATH " << path.to_s
		#Si esta en el home, se actualiza la página
		respond_to do |format|
			if path.include? "/"
				format.js { render "new_round"}
			else
				#Si esta en otra vista, imprime la alerta
			    format.js {render inline: "location.reload();" }
			end
		end
	end
end
