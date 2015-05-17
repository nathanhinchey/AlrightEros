class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnser.new(user_answer_params)
    if @user_answer.save
      render json: @user_answer
    else
      render json: @user_answer.errors.full_messages
    end
  end

  def index
  end

  private
    def user_answer_params
      params.require(:user_answer).permit(:answer_id)
    end
end
