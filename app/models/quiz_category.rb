class QuizCategory < ApplicationRecord
  #join table for many to many relationship 
  belongs_to :quiz
  belongs_to :category
end
