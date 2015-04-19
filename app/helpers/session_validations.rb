helpers do


  def validate_user
    if session[:id]
      puts "session id detected"
      return User.find(session[:id])
    else
      puts "anonymous user detected"
      return User.find_by(username: "Anonymous")
      # puts "no session id"
      # redirect "/"
    end
  end

  def only_take_once

  end

end
