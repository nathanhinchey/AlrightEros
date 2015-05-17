json.array! @user_answers do |user_answer|
  json.id = user_answer.id
  json.question_id = user_answer.question.id
  json.answer_id = user_answer.answer.id
end
