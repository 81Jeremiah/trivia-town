class Guess < ApplicationRecord
  belongs_to :game
  before_save :downcase_fields

#changes all data in guess fields do lowercase before save to correctly score game
  def downcase_fields
      self.guess.downcase!
   end
end
