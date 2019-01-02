class CategoriesController < ApplicationController
  before_action :require_login

#show page by category chosen
   def show
     category = Category.find_by_name(params[:id])

     @quizzes = Quiz.by_category(category.name)
     render json: @quizzes, status: 200
  end
  end

end
