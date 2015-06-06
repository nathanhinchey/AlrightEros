json.id current_user.id
json.has_profile current_user_has_profile?
if current_user.profile
  json.profile_id current_user.profile.id
  json.username current_user.profile.username
  json.birthday current_user.profile.birthday
else
  json.username "friend! Please make your profile"
end
json.answered_questions current_user.profile.question_ids
