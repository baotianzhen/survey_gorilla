get '/users' do
  @users = Users.all
  erb :'/users'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/users/#{user.id}'
  else
    # @errors = user.errors.full_messages.to_sentence
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
end

get '/users/:id/edit' do
end





