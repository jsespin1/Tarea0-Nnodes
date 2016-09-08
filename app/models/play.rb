class Play < ApplicationRecord
  belongs_to :player
  belongs_to :round

  before_create :set_color

  def set_bet(jugador)
  	#Si tienen menos de 1000, va All-In
  	apuesta = 0
  	if jugador.money > 1000
  		#Si no hay lluvia, se apuesta entre el 8% y el 15%
  		aleatorio = rand(8..15)
  		apuesta = (aleatorio/100)*jugador.money
  	else
  		apuesta = jugador.money
  	self.bet = apuesta
  end

  def getResult(color_resultado)
  	color = self.color
  	apuesta = self.bet
  	resultado = 0
  	if color_resultado == color
  		if color == 'verde'
  			resultado = apuesta*15
  		else color == 'rojo'
 			resultado = apuesta*2	
  	else
  		resultado = apuesta*-1

  	return resultado
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
