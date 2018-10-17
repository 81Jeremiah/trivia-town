class Guess < ApplicationRecord
  belongs_to :game
  before_save :downcase_fields


  def downcase_fields
      self.guess.downcase!
   end
end
