class CategoriesController < ApplicationController
  before_action :require_login

#show page by category chosen
   def show
     category = Category.find_by_name(params[:category])
     @quizzes = Quiz.by_category(category.id)
  end

end
