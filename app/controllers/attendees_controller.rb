class AttendeesController < ApplicationController
    # def create
    #     Attendee.create attendee_params
    #     puts '--------- attending event -------------'
    #     redirect_to "/events"
    #   end
    
    #   def destroy
    #     Attendee.find_by(user:current_user, event: Event.find(params[:id])).delete
    #     puts '--------- NOT attending event -------------'
    #     redirect_to "/events"    
    #   end
    
    #   private
    #     def attendee_params
    #       params.require(:attendee).permit(:event_id).merge(user: current_user)
    #     end
    # end
