class Play < ApplicationRecord
  belongs_to :player
  belongs_to :round

  before_create :set_color

  def set_bet(jugador, habra_lluvia)
  	#Si tienen menos de 1000, va All-In
  	apuesta = 0
    disponible = jugador.money
  	if disponible > 1000
  		#Si no hay lluvia, se apuesta entre el 8% y el 15%
      if !habra_lluvia
        aleatorio = rand(8..15)
        apuesta = (aleatorio*disponible)/100
      else
        aleatorio = rand(4..10)
        apuesta = (aleatorio*disponible)/100
      end
  	else
  		#All-In
  		apuesta = disponible
  	end
  	#puts "Apuesta Jugador" << apuesta.to_s
  	self.bet = apuesta
  	self.save
  end

  def getResult(color_resultado)
  	color = self.color
  	apuesta = self.bet
  	resultado = 0
  	if color_resultado == color
  		if color == 'verde'
  			resultado = apuesta*15
  		else
 			resultado = apuesta*2
 		end	
  	else
  		resultado = apuesta*-1
  	end

  	return resultado
  end

  #Método que actualiza el balance de cada jugador depués de terminada una ronda
  def self.set_balance(apuesta, color)
    ganancia = apuesta.getResult(color)
    Player.set_balance(apuesta.player, ganancia)
  end

  private
  def set_color
  	aleatorio = rand(1..100)
  	if aleatorio <= 2
  		self.color = 'green'
  	elsif aleatorio <= 51
  		self.color = 'red'
  	else
  		self.color = 'black'
  	end
  end

end
