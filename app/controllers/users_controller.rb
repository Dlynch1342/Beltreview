class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  def new
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def index
    if session[:user_id]
      redirect_to current_user
    else
      redirect_to '/sessions/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages     
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def create
    @user = User.new user_params
    if @user.save
    else
      flash[:errors] = @user.errors.full_messages
    end
    redirect_to "/sessions/new"
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
    end
end
