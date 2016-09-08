class CreateRoulettes < ActiveRecord::Migration[5.0]
  def change
    create_table :roulettes do |t|
      t.integer :rounds
      t.integer :total_bet

      t.timestamps
    end
  end
end
