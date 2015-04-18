get '/users' do
  @users = Users.all
  erb :'/users'
end

#we currently don't need this page because you can log in any time
get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    puts "user #{user.id} saved!"
    session[:id] = user.id
    # redirect "/users/#{user.id}" #maybe for later
    redirect "/"
  else
    # @errors = user.errors.full_messages.to_sentence
    puts "login fail :|"
    redirect "/"
  end
end

get '/users/:id' do
  redirect "/" unless params[:id].to_i == session[:id]
  @user = User.find(session[:id])
  @surveys = @user.surveys
  erb :'/users/show'
  redirect '/'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  if @user.update(params[:user])
    redirect '/users/#{@user.id}'
  else
    # @errors = user.errors.full_messages.to_sentence
    erb :'/users/edit'
  end
end

delete '/users/:id' do
  @user = User.find(params[:id])
  if @user.destroy
    redirect '/'
  else
    # @errors = user.errors.full_messages.to_sentence
    erb :'/users/show'
  end
end





