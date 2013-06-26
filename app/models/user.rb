class User < ActiveRecord::Base
  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, password)
  	member = User.find_by_email(email)
  	  if member.nil?
  	  	return false
  	  elsif password == member.password
  	  	return true
  	  else
  	  	return false
  	  end
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end

end
