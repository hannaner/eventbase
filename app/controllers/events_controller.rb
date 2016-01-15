class EventsController < ApplicationController

  def index
  	@events = Event.all
  	@user = User.find(session[:user_id])
  end

  def profile
  	@event = Event.find(params[:id])
  	@attend = Attendance.where(event: Event.find(params[:id]))
  	@comment = Comment.where(event: Event.find(params[:id]))
  	@comments = Comment.find_by(event: params[:id])
  end

  def ecreate
  	user = User.find_by(id: session[:user_id])
  	if Location.find_by(city: params[:city])
		  location = Location.find_by(city: params[:city])
	  else
		  location = Location.create(city: params[:city], state: params[:state])
	  end
	event = Event.create(name: params[:name], date: params[:date], location: location, user: user)
	attendance = Attendance.create(user: user, event: event)
  redirect_to "/events"
  end

  def join
  	user = User.find_by(id: session[:user_id])
  	event = Event.find(params[:id])
  	attendance = Attendance.create(user: user, event: event)
  	redirect_to "/events"
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def leave
    user = User.find_by(id: session[:user_id])
    event = Event.find(params[:id])
    attendance = Attendance.find_by(user: user, event: event)
    if attendance.blank? == false
      attendance.destroy
      redirect_to "/events"
    else
      redirect_to "/events"
    end
  end

  def eupdate
  	event = Event.find(params[:id])
  	if Location.find_by(city: params[:city])
		location = Location.find_by(city: params[:city])
	else
		location = Location.create(city: params[:city], state: params[:state])
	end
	event.update_attribute(:name, params[:name])
	event.update_attribute(:date, params[:date])
	event.update_attribute(:location, location)
	redirect_to '/events'
  end

  def destroy
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to "/events"
  end
end
