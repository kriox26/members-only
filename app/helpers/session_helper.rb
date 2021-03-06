module SessionHelper

  # Log's the given member in
  def log_in(member)
	current_member=(member)
	session[:member_id] = member.id
	remember(member)
  end

  # Set's cookies to remember current member
  def remember(member)
	member.remember
	cookies.permanent.signed[:member_id] = member.id
	cookies.permanent[:remember_token] 	 = member.remember_token
  end

  # Returns the currently logged in member
  def current_member
	if (member_id = session[:member_id])
	  current_member=(Member.find_by(id: member_id))
	elsif (member_id = cookies.signed[:member_id])
	  member = Member.find_by(id: member_id)
	  if member && member.authenticated?(cookies[:remember_token])
	    log_in member
		current_member=(member)
	  end
	end
  end

  # Set's the current member if it's not set already
  def current_member=(member)
	@current_member ||= member
  end

  # Checks if a member is logged in
  def logged_in?
	!current_member.nil?
  end

  def forget(member)
	member.forget
	cookies.delete(:member_id)
	cookies.delete(:remember_token)
  end

  # Log's out the given member
  def log_out
	forget(current_member)
	session.delete(:member_id)
	current_member=(nil)
  end

end
