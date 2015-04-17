get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys' do
  survey = Survey.new(params[:survey])
  if survey.save
    redirect '/surveys'
  else
    @errors = survey.errors.full_messages.to_sentence
    erb :'/surveys/new'
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'/surveys/show'
end

# probably won't use beyond this point

# get '/surveys/:id/edit' do
#   @survey = Survey.find(params[:id])
#   erb :'/surveys/edit'
# end

# put '/surveys/:id' do
#   survey = Survey.find(params[:id])
#   if survey.update(params[:survey])
#     redirect '/surveys/#{survey.id}'
#   else
#     @errors = survey.errors.full_messages.to_sentence
#     erb :'/surveys/edit'
#   end
# end

# delete '/surveys/:id' do
#   survey = Survey.find(params[:id])
#   if survey.destroy
#     redirect '/surveys/#{survey.id}'
#   else
#     @errors = survey.errors.full_messages.to_sentence
#     erb :'/surveys/edit'
#   end
# end
