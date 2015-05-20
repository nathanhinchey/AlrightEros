json.array! @user_answers do |user_answer|
  json.id = user_answer.id
  json.question do
    json.question_id = user_answer.question.id
    json.question_body = user_answer.question.question_body
    if @answered_questions.include?(user_answer.question.id)
      json.answer_text = user_answer.answer.answer_text
    end
  end
end
