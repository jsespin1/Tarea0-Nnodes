class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def home
  	#Se debe (1) Asignar apuestas a cada jugador, (2) Determinar color ronda, (3) Actualizar los resultados a cada jugador
  	@color = Play.create
  	@jugadores = Player.all
  	@round = Round.last
  end


end
