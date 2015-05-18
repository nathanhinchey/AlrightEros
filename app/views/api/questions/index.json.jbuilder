json.array! @questions do |question|
  json.id question.id
  json.question_body question.question_body
end
