class Api::QuestionsController < ApplicationController
  def create
    full_params = question_params
    answer_params = full_params.delete("answers")
    @question = Question.new(full_params)
    answer_params.each do |key, answer|
      @question.answers.new(answer) if answer.length > 0;
    end
    if @question.save
      render :show
    else
      render json: @question.errors.full_messages
    end
  end

  def index
    @questions = Question.all.page(params[:page]).per(10)
    render :index
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  private
    def question_params
      params
        .require(:question)
        .permit(
          :question_body,
          answers: [:answer_text]
          )
    end

    def parse_input(permittedParams)
      permittedParams["answers"];

    end
end


# def question_params(parameters)
#   parameters.require(:question).permit(:question_body, answers: [:answer_text])
# end
#
# params = ActionController::Parameters.new({
#   question: {
#     question_body: 'How old are you?',
#     age:  22,
#     answers: {'1' => {answer_text: "I'm okay."}, '2' => {answer_text: "I'm really sad"}
#   }}
# })
#
# permitted = question_params(params)
