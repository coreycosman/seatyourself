class UsersController < ApplicationController

  def create
    @user = User.new
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]

      if @user.save
        flash[:notice] = "Account Successfully Created!"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Sorry, try again!"
        render :new
      end
  end

  def new
    @user = User.new
  end


end
