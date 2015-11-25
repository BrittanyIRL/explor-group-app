class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate login_params['email'], login_params['password']

  	if user
  		session[:user_id] = user.id
  		flash[:success] = "#{user.email} is logged in!"
  		redirect_to "/#explor" 
  	else
  		flash[:danger] = "You must be logged in with the correct username and password!"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "You have successfully logged out!"
  	redirect_to "/"
  end

  private

  def login_params
  	params.require(:user).permit(:email, :password)
  end

end
