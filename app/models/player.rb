class Player < ApplicationRecord

	has_many :plays, :dependent => :delete_all


	validates :name, presence: true, uniqueness: true

	before_create :set_initial


	def self.set_balance(jugador, ganancia)
		jugador.money = jugador.money + ganancia
		jugador.save
	end

	def self.increase_balance(jugador, extra)
		jugador.money = jugador.money + extra
		jugador.save
	end


	def set_initial
	    self.money = 10000
	    self.active = true
  	end

end
