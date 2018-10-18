module QuizzesHelper

  def flash_message
    if flash[:message]
      flash[:message]
    end
  end

  def user_created_quiz?
    @quiz.user_id == current_user.id
  end
end
