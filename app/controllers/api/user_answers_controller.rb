class Api::UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user_id = 1 #HACK TODO FIXME (this is just for testing)
    if @user_answer.save
      render json: @user_answer
    else
      render json: @user_answer.errors.full_messages
    end
  end

  def index
    @user_answers = User.find(params[:user_id]).user_answers
    render :index
  end

  private
    def user_answer_params
      params.require(:user_answer).permit(:answer_id)
    end
end
