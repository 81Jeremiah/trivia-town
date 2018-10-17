module QuizzesHelper

  def flash_message
    if flash[:message]
      flash[:message]
    end
  end
end
