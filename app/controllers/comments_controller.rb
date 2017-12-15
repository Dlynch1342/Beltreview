class CommentsController < ApplicationController
  def create
		new_comment = Comment.new(user:current_user, event:Event.find(params[:event_id]), content: params[:text])
		puts '------------------------'
		puts new_comment
		puts '------------------------'
		new_comment.save
  	redirect_to "/events/#{Event.find(params[:event_id]).id}" 
  end
end
