class CreateTrviaScores < ActiveRecord::Migration[5.2]
  def change
    create_table :trvia_scores do |t|

      t.timestamps
    end
  end
end
