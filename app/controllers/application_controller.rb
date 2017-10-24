class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please Log In"
      redirect_to new_sessions_path
    end
  end

  def ensure_ownership
    @restaurant = Club.find(params[:id])
    if session[:user_id] == nil || @restaurant.user_id != current_user.id
      redirect_to root_path
    end
  end

end
