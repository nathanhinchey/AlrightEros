
json.array! @messages do |message|
	is_sender = message.sender_id == @profile
	json.body message.body
	json.is_sender is_sender
	json.sender_username (message.sender.username)
	json.other_user (is_sender ? message.receiver_id : message.sender_id)
	json.timestamp message.created_at
end
