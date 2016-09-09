class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def home
  	#Se debe (1) Asignar apuestas a cada jugador, (2) Determinar color ronda, (3) Actualizar los resultados a cada jugador
  	#(1)
  		#Primero se crea la ronda, esta tiene asociada una ruleta
  	ruleta = Roulette.first
  	#puts "Ruleta: " + ruleta.inspect
  	@rondas = ruleta.rounds.length
  	@nueva_ronda = Round.create(:roulette => ruleta)
  	#puts "Nueva Ronda: " + @nueva_ronda.inspect
  	jugadores = Player.where(active:true).sort_by{ |t| t.money }.reverse 
  	jugadores.sort! { |a,b| b.money <=> a.money }
  	#puts "Jugadores: " + jugadores.inspect
  	@apuestas = Array.new
  	#Consultamos a API si lloverá durante los próximos 7 días
  	habra_lluvia = Weather2.forecast_rain
  	jugadores.each do |j|
	  bet = Play.create(:player => j, :round => @nueva_ronda)
	  bet.set_bet(j, habra_lluvia)
	  #puts "Apuesta: " + bet.inspect
	  @apuestas.push(bet)
	end
  	#(2)
  	@color = set_color
  	#(3) - Para cada apuesta, se llama un metodo interno que toma el jugador y el mismo se actualiza su monto de dinero
  	@apuestas.each do |a|
  		#Play.set_balance(a, @color)
	end
	#Arreglo json con las predicciones por dia. Atributos: code,date,day,text
	@clima = Weather2.get_forecast
	@pronostico = ""
	if habra_lluvia
		@pronostico = "Se pronostica lluvia dentro de los próximos 7 días. Apuestas conservadoras."
	else
		@pronostico = "No se anuncian chubascos durante la próxima semana."
	end
  end


  private
  def set_color
  	aleatorio = rand(1..100)
  	if aleatorio <= 2
  		color = 'green'
  	elsif aleatorio <= 51
  		color = 'red'
  	else
  		color = 'black'
  	end
  	return color
  end


end
