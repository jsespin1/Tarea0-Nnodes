class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.string :color
      t.references :player, foreign_key: true
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
