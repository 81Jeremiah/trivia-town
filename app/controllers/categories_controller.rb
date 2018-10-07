class CategoriesController < ApplicationController
   def show
     category = Category.find_by_name(capitalize_params)
     @quizzes = Quiz.by_category(category.id)
  end


  private
    def capitalize_params
      params[:category].capitalize
    end

end
