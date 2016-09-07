class Player < ApplicationRecord

	has_many :plays, :dependent => :delete_all

end
