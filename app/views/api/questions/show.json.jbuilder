json.id @question.id
json.question_body @question.question_body
json.anaswers @question.answers do |answer|
  json.answer_id answer.id
  json.answer_text answer.answer_text
end
