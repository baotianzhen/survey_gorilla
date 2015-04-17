get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find(session[:id])
end


