class CommentsController < ApplicationController
  before_action :require_login

#create comment and post on associated quiz show page
  def create
    if params[:quiz_id]
     @quiz = Quiz.find(params[:quiz_id])
     @comment = @quiz.comments.build(comment_params)
     @comment.user = current_user
     @comment.save
     render json: @comment, status: 201
     # redirect_to @quiz
   end
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
