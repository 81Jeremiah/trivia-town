class Category < ApplicationRecord
  has_many :quiz_categories
  has_many :quizzes, through: :quiz_categories
  before_save :downcase_fields

  def downcase_fields
      self.name.downcase!
   end

  def to_param
    name
  end
end
