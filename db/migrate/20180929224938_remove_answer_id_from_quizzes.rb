class RemoveAnswerIdFromQuizzes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quizzes, :answer_id
  end
end
