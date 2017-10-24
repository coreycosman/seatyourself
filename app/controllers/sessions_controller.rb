class SessionsController < ApplicationController

def create
 user = User.find_by(email: params[:email])
 if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect_to restaurants_url, notice: 'Logged in!'

 else
   render new_user_path
 end
end
def desroy
  session[:user_id] = nil
  redirect_to restaurants_url, notice: 'Logged out!'
end


end
