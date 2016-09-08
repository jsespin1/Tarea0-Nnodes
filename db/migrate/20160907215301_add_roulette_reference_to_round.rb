class AddRouletteReferenceToRound < ActiveRecord::Migration[5.0]
  def change
    add_reference :rounds, :roulette, foreign_key: true
  end
end
