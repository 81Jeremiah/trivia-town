class CategoriesController < ApplicationController
  before_action :require_login

   def show
     category = Category.find_by_name(params[:category])
     @quizzes = Quiz.by_category(category.id)
  end




end
