class QuestionAndAnswer < ApplicationRecord
  belongs_to :quiz

  validates :question, presence: true
  validates :answer, presence: true
  before_save :downcase_fields

#makes answers lowercase to match guesses 
  def downcase_fields
      self.answer.downcase!
   end

 end
