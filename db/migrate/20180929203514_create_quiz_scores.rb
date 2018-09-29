class CreateQuizScores < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_scores do |t|

      t.timestamps
    end
  end
end
