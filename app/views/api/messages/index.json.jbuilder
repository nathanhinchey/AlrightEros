json.array! current_user.messages do |message|
	json.body message.body
	json.sender_id message.sender_id
	json.receiver_id message.receiver_id
	json.timestamp message.created_at
end
