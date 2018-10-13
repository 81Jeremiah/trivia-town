class DropQuizScores < ActiveRecord::Migration[5.2]
  def change
    drop_table :quiz_scores do |t|
    t.integer :user_id
    t.integer :quiz_id
    t.integer :score
    t.timestamps
    end
  end
end
