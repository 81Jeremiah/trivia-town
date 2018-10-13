class QuestionAndAnswer < ApplicationRecord
  belongs_to :quiz
  validates :question, presence: true
  validates :answer, presence: true


 end
