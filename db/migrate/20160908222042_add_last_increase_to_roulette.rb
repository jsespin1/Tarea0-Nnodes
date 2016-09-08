class AddLastIncreaseToRoulette < ActiveRecord::Migration[5.0]
  def change
    add_column :roulettes, :last_increase, :datetime
  end
end
