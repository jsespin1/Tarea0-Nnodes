class Player < ApplicationRecord

	has_many :plays, :dependent => :delete_all


	validates :name, presence: true, uniqueness: true

	before_save :set_initial


	def set_initial
	    self.money = 10000
	    self.active = true
  	end

end
