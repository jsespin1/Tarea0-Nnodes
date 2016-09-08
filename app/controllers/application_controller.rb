class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def home
  	#Se debe (1) Asignar apuestas a cada jugador, (2) Determinar color ronda, (3) Actualizar los resultados a cada jugador
  	#(1)
  		#Primero se crea la ronda, esta tiene asociada una ruleta
  	ruleta = Roulette.first
  	rondas = ruleta.rounds.length
  	@nueva_ronda = Round.create(:roulette => ruleta)
  	jugadores = Player.where(active:true)
  	jugadores.sort! { |a,b| b.money <=> a.money }
  	@apuestas = Array.new
  	jugadores.each do |j|
	  bet = Play.create(:player => j, :round => nueva_ronda)
	  bet.set_bet(j)
	  @apuestas.push(bet)
	end
  	#(2)
  	@color = Play.create(:player => nil, :round => nueva_ronda)
  end


end
