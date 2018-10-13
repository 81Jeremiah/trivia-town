class DropQuestions < ActiveRecord::Migration[5.2]
  def change
    drop_table :questions do |t|
      t.text :question
      t.integer :quiz_id
      t.timestamps
    end
  end
end
