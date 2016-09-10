class RouletteController < ApplicationController

	respond_to :js

	def increase
		ruleta = Roulette.first
		last_increase = ruleta.last_increase
		if last_increase.utc < (Time.now - 24.hours - 3.hours).utc
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
		if last_round.utc < (Time.now  - 3.hours - 3.minutes).utc
			ruleta.last_round = Time.now - 3.hours
			ruleta.save
			Roulette.new_round
		end
		path = request.original_url
		puts "PATH " << path.to_s
		#Si esta en el home, se actualiza la página
		respond_to do |format|
			if last_round.utc < (Time.now  - 3.hours - 3.minutes).utc
				format.js { render "new_round", notice: 'Last Round: ' << Time.now.strftime("%Y-%m-%d %H:%M:%S")}	
			else
				format.js { render "nothing", notice: 'Last Round: ' << Time.now.strftime("%Y-%m-%d %H:%M:%S")}	
			end
			#format.js {render inline: "location.reload();" }
		end
	end


end
