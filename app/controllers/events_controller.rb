class EventsController < ApplicationController
	
	# before_action :require_current_user

  def new
  end

  def index
  	@events_sameState = Event.where(state:current_user.state)
	@events_otherState = Event.where.not(state:current_user.state)  
  end

  def create
  	@event = Event.new(event_params)
	@event.user = current_user
	if @event.save
		#nothing
  	else
		flash[:errors] = @event.errors.full_messages
  	end
    redirect_to '/events'
  end

  def show
  	@event = Event.find(params[:id])
  	@comments = Comment.where(event: @event)
  	if !@comments
  		@comments = []
  	end
  	puts @comments
  end
#   def update
#   	@event = Event.find(params[:event_id])
#   	@event.name = params.require(:event).permit(:name)[:name]
#   	@event.date = params.require(:event).permit(:date)[:date]
#   	@event.location = params.require(:event).permit(:location)[:location]
#   	@event.state = params.require(:event).permit(:state)[:state]

#   	if @event.valid?
#   		@event.save
#   		return redirect_to eventsIndex_path params[:event_id]
#   	end
#   	flash[:failed] = @event.errors.full_messages
#   	return redirect_to eventsEdit_path 

#   end

  def edit
	@event = Event.find(params[:event_id])
	redirect_to '/events'
  end

  def destroy
	Event.find(params[:id]).destroy
	redirect_to '/events'
  end

  def join
  	Attendee.create(user:current_user, event:Event.find(params[:event_id]))
  	return redirect_to "/events"
  end

  def cancel
	Attendee.find(params[:id]).destroy
  	return redirect_to "/events"
  end

  private
  	def event_params
		params.require(:event).permit(:name, :date, :location, :state)
	end
end