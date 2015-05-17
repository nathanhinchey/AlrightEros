class Api::UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user_id = current_user.id
    if @user_answer.save
      render json: @user_answer
    else
      render json: @user_answer.errors.full_messages
    end
  end

  def index
    if !!current_user
      @user_answers = User.find(params[:user_id]).user_answers
      @answered_questions = current_user.question_ids
      render :index
    else
      render json: {}
    end
  end

  private
    def user_answer_params
      params.require(:user_answer).permit(:answer_id)
    end
end
