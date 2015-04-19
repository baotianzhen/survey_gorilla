#INDEX
get '/surveys' do
  @user = validate_user
  @surveys = Survey.all
  # @user_surveys = @user.surveys
  erb :'/surveys'
end

#NEW
get '/surveys/new' do
  @user = validate_user
  if request.xhr?
    erb :"/surveys/_new", layout: false
  else
    erb :'/surveys/new'
  end
end

#CREATE
post '/surveys' do
  puts params
  @survey = Survey.new(params[:survey])
  if @survey.save
    if request.xhr?  
      @user = validate_user
      @question = Question.new(survey_id: @survey.id)
      # erb :"questions/new"
      erb :"/questions/new", layout: false
    else
      redirect "/surveys/#{@survey.id}/questions/new"
    end
  else
    @errors = @survey.errors.full_messages.to_sentence
    erb :'/surveys/new'
  end
end

#SHOW
get '/surveys/:id' do
  @user = validate_user
  @survey = Survey.find(params[:id])
  @responses = @survey.responses 
  @questions = @survey.questions
  @submissions = @survey.submissions
  erb :'/surveys/show'
end

#EDIT
get '/surveys/:id/edit' do
  @user = validate_user
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
