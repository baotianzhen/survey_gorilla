#INDEX
get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys'
end

#NEW
get '/surveys/new' do
  @user = User.find(session[:id])
  erb :'/surveys/new'
end

#CREATE
post '/surveys' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    @errors = @survey.errors.full_messages.to_sentence
    erb :'/surveys/new'
  end
end

#SHOW
get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @responses = @survey.responses 
  @questions = @survey.questions
  @submissions = @survey.submissions
  erb :'/surveys/show'
end

#EDIT
get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])
  erb :'/surveys/edit'
end

#UPDATE
put '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if @survey.update(params[:survey])
    redirect '/surveys/#{@survey.id}'
  else
    @errors = @survey.errors.full_messages.to_sentence
    erb :'/surveys/edit'
  end
end

#DELETE
delete '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if @survey.destroy
    redirect 'user/:user_id/surveys'
  else
    @errors = @survey.errors.full_messages.to_sentence
    erb :'/surveys/edit'
  end
end
