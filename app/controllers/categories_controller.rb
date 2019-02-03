class CategoriesController < ApplicationController
  before_action :require_login
#render all categories if all selected
  def index
    @quizzes = Quiz.all
    render json: @quizzes, status: 200
  end
#show page by category chosen
   def show
     category = Category.find_by_name(params[:id])
     @quizzes = Quiz.by_category(category.name)
     render json: @quizzes, status: 200
    end

  def searhBar
    render '/categories/category_search_bar', layout: false
  end

  end
