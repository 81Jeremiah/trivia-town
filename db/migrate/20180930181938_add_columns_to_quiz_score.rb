class AddColumnsToQuizScore < ActiveRecord::Migration[5.2]
  def change
    add_column :quiz_scores, :user_id, :integer
    add_column :quiz_scores, :quiz_id, :integer
    add_column :quiz_scores, :score, :integer
  end
end
