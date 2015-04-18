get "/surveys/:id/questions/new" do
  @question = Question.new(survey_id: params[:id])
  erb :"questions/new"
end

post "/questions" do
  puts params
  @question = Question.new(params[:question])
  if @question.save
    redirect "/surveys/#{@question.survey_id}/questions/new"
  else
    @errors = @question.errors.full_messages.to_sentence
    erb :"questions/new"
  end
end

post "/questions/complete" do
  puts params
  @question = Question.new(params[:question])
  if @question.save
    redirect "/surveys/#{@question.survey_id}"
  else
    @errors = @question.errors.full_messages.to_sentence
    erb :"questions/new"
  end
end

