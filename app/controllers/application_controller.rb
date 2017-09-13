class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  layout "application"

   def new
   end
   
   #friends Functionality##########################
   def my_friends
    @friendships = current_user.friends
   end 

   def search
     @users = User.search(params[:search_param])

     if @users
      @users = current_user.except_current_user(@users)
      render partial: "friends/lookup"
     else
      render status: :not_found,nothing: true
     end
   end

   def add_friend
     @friend = User.find(params[:friend])
     current_user.friendships.build(friend_id: @friend.id)

     if current_user.save
        redirect_to my_friends_path, notice: "friend was succesfully added"
     else
        redirect_to my_friends_path,flash[:error] = "There was an error with adding user as friend"
     end
   end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:dob])
    end


end

