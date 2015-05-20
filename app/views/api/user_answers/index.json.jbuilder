json.array! @user_answers do |user_answer|
  json.id user_answer.id
  json.question_id user_answer.question.id
  json.question_body user_answer.question.question_body
  if @answered_questions.include?(user_answer.question.id)
    json.answer_text user_answer.answer.answer_text
    json.your_answer current_user.answers.find_by(question_id: user_answer.question.id)
  end
end
