json.id @question.id
json.question_body @question.question_body
json.created_at @question.created_at
json.answers @question.answers do |answer|
  json.id answer.id
  json.answer_text answer.answer_text
end
