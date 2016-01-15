class UsersController < ApplicationController

	def index
	end

	def create
		if Location.find_by(city: params[:city])
			location = Location.find_by(city: params[:city])
		else
			location = Location.create(city: params[:city], state: params[:state])
		end
		user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: location, password: params[:password])
		session[:username] = user.first_name
		session[:user_id] = user.id
		if user.valid?
			redirect_to '/events'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def show
		@user = User.find_by(id: session[:user_id])
	end

	def update
		user = User.find_by(id: session[:user_id])
		if Location.find_by(city: params[:city])
			location = Location.find_by(city: params[:city])
		else
			location = Location.create(city: params[:city], state: params[:state])
		end

		# user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: location)
		user.update_attribute(:first_name, params[:first_name])
		user.update_attribute(:last_name, params[:last_name])
		user.update_attribute(:email, params[:email])
		user.update_attribute(:location, location)
		redirect_to '/events'
	end

end
