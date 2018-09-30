class AddGuessToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :guess, :text
  end
end
