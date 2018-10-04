class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.string :guess
      t.integer :game_id
      t.timestamps
    end
  end
end
