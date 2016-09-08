class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :money, :default => 10000
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
