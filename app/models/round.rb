class Round < ApplicationRecord

	belongs_to :roulette
	has_many :plays, :dependent => :delete_all

end
