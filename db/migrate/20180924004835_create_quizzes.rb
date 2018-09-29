class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :question_id
      t.integer :answer_id
      t.integer :quiz_score_id
      t.integer :user_id

      t.timestamps
    end
  end
end
