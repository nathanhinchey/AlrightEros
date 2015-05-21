class Message < ActiveRecord::Base
	validates :sender_id, presence: true
	validates :receiver_id, presence: true

	belongs_to :sender,	class_name: 'User', foreign_key: :sender_id
	belongs_to :receiver, class_name: :user, foreign_key: :receiver_id

end
