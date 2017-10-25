class SessionsController < ApplicationController

def create
 user = User.find_by(email: params[:email])
 if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to restaurants_path, notice: 'Logged in!'
 else
   flash.now[:error] = "Sorry, try again!"
   render new_session_path 
 end
end
def destroy
  session[:user_id] = nil
  redirect_to restaurants_url, notice: 'Logged out!'
end


end
