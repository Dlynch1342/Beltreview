class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  
    def current_user
     User.find(session[:user_id]) if session[:user_id]
    end
  
    def require_login
      redirect_to '/sessions/new' unless session[:user_id]
    end
  
    def require_current_user
      user = User.find(params[:id])
      redirect_to "/user/#{current_user.id}" if current_user != user 
    end
    
    helper_method :current_user
  end
