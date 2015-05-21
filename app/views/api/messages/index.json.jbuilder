json.array! current_user.messages do |message|
	is_sender = message.sender_id == current_user.id
	json.body message.body
	json.is_sender is_sender
	json.other_user (is_sender ? message.receiver_id : message.sender_id)
	json.timestamp message.created_at
end
