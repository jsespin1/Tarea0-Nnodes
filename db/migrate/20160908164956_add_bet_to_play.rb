class AddBetToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :bet, :integer
  end
end
