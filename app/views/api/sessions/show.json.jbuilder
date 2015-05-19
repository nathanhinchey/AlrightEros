json.id current_user.id
json.has_profile current_user_has_profile?
if current_user.profile
  json.username current_user.profile.username
else
  json.username "friend! Please make your profile"
end
json.answered_questions current_user.question_ids
