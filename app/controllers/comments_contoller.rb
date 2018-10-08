class GamesController < ApplicationController

def create
   @quiz = Quiz.find(params[:quiz_id])
   @comment = @quiz.comments.build(comment_params)
   @comment.user = current_user
   @comment.save
   redirect_to @post
end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end