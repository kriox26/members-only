class SessionController < ApplicationController

  def new
  end

  def create
	member = Member.find_by(email: params[:session][:email].downcase)
	if member && member.authenticate(params[:session][:password])
	  log_in member
	  flash.now[:success] = "Welcome to Members only!"
	  redirect_to root_url
	else
	  flash.now[:danger] = "Invalid email/password combination!"
	  render :new
	end
  end

end
