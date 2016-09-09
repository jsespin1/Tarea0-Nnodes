class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def home
  	ruleta = Roulette.first
  	@rondas = ruleta.rounds.length
  	@ultima_ronda = Round.last
  	@apuestas = Play.where(round_id:@ultima_ronda.id)
  	#Consultamos a API si lloverá durante los próximos 7 días
  	habra_lluvia = Weather2.forecast_rain
  	@color = @ultima_ronda.last_color
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
