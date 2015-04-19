helpers do


  def validate_user
    if session[:id]
      puts "session id detected"
      return User.find(session[:id])
    else
      puts "anonymous user detected"
      anonymous_user ="Anonymous_#{Time.now}"
      return User.create(username: anonymous_user, email: "#{anonymous_user}@anonymous.com", password_hash: anonymous_user)
      # puts "no session id"
      # redirect "/"
    end
  end

  def only_take_once

  end

end
