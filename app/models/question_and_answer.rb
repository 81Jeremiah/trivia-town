class QuestionAndAnswer < ApplicationRecord
  belongs_to :quiz

  validates :question, presence: true
  validates :answer, presence: true
  before_save :downcase_fields


  def downcase_fields
      self.answer.downcase!
   end

 end
