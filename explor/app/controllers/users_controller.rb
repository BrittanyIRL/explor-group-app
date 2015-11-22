class UsersController < ApplicationController
  def new
  	@users = User.new
  end

  def create
  	user = User.create user_params
  	puts user.errors.inspect
  	if user.valid?
  		session[:user_id] = user.id
  		flash[:success] = "User created and logged in"
  		redirect_to root_path
  	else
  		messages = user.errors.map { |k, v| "#{k} #{v}" }
  		flash[:danger] = messages.join(', ')
  		redirect_to signup_path
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
