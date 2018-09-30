class RemoveQuestionIdFromQuizzes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :question_id

  end
end
