class CommentsController < ApplicationController
	def create
		user = User.find(session[:user_id])
		event = Event.find(params[:id])
		Comment.create(content: params[:content], user: user, event: event)
		redirect_to "/events/#{event.id}"
	end
end
