before /^(?!\/)/ do
  unless session(:id)
    redirect '/login'
  end
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find(params[:id])
  if User.authenticate(user)
    session[:id] = user.id
    redirect '/users/#{user.id}'
  else
    erb :login
  end
end


