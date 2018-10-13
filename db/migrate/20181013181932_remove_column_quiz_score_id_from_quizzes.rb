class RemoveColumnQuizScoreIdFromQuizzes < ActiveRecord::Migration[5.2]
  def change

    remove_foreign_key :quizzes, :quiz_score_id
  end
end
