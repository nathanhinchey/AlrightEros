json.array! current_user.messages do |message|
	is_sender = message.sender_id == current_user.id
	json.body message.body
	json.is_sender is_sender
	if is_sender
		json.other_user message.receiver.profile.username
	else
		json.other_user message.sender.profile.username
	end
	json.timestamp message.created_at
end
