class Api::UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.profile_id = current_user.profile.id
    # TODO: add acceptable answers, and associated matching algorithm
    # params[:acceptable_answers].each |acceptable_answer| do
    #   @user_answer.acceptable_answers.new{answer_id: acceptable_answer}
    # end
    if params[:profile_id].to_i != current_user.profile.id
      head status: :forbidden
    elsif @user_answer.save
      render json: @user_answer
    else
      render json: @user_answer.errors.full_messages, status: 422
    end
  end

  def index
    if !!current_user
      @user_answers = Profile.find(params[:profile_id]).user_answers
      @answered_questions = current_user.profile.question_ids
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
