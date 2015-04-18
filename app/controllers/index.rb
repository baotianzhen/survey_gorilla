# before /^(?!\/)/ do
#   unless session[:id]
#     redirect '/login'
#   end
# end

get '/' do
	@surveys = Survey.all
	@user = User.find(session[:id]) if session[:id]
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
	puts params[:login][:username]
	puts params[:login][:password]
  # user = User.find(session[:id])
  @user = User.authenticate(params[:login][:username], params[:login][:password])
	if @user
  	session[:id] = @user.id
  	puts "user #{@user.id} authenticated"
  	redirect "/users/#{@user.id}"
  else
  	puts "fail"
  	redirect "/"
  end
end

get "/logout" do
	session[:id] = nil
	redirect "/"
end

