class AddLastRoundTimeToRoulette < ActiveRecord::Migration[5.0]
  def change
    add_column :roulettes, :last_round, :datetime
  end
end
