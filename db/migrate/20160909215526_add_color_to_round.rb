class AddColorToRound < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :last_color, :string
  end
end
