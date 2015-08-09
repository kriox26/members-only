class SessionController < ApplicationController

  def new
  end

  def create
	member = Member.find_by(email: params[:session][:email].downcase)
	if member && member.authenticate(params[:session][:password])
	  # Log's the user in and remembers him/her by default
	  log_in member
	  flash.now[:success] = "Welcome to Members only!"
	  redirect_to root_url
	else
	  flash.now[:danger] = "Invalid email/password combination!"
	  render :new
	end
  end

  def destroy
	log_out if logged_in?
	redirect_to root_url
  end

end
