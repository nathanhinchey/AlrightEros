class Api::MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		@message.sender_id = current_user.profile.id
		if @message.save
			render :show
		else
			render json: @message.errors.full_messages
		end
	end

	def show
		@message = Message.find(params[:id])
		if current_user.profile.messages.include? @message
			render :show
		else
			head status: :forbidden
		end
	end

	def index
		unless current_user
			render json: []
			return
		end
		if params["recent"]
			seen = {}
			@messages = current_user.profile.messages.sort do |m1, m2|
				m2.created_at <=> m1.created_at
			end.select do |m|
				other = m.sender_id == current_user.id ? m.receiver_id : m.sender_id
				if seen[other]
					false
				else
					seen[other] = true
				end
			end
		else
			@messages = current_user.profile.messages
			@profile = current_user.profile.id
			render :index
		end
	end

	private
		def message_params
			params.require(:message).permit(:receiver_id, :body)
		end
end
