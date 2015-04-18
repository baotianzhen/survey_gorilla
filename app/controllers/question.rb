get "/surveys/:id/questions/new" do
  @survey = Survey.find(params[:id])
  @question = Question.new(survey_id: params[:id])
  erb :"questions/new"
end

post "/surveys/:id/questions" do
  @survey = Survey.find(params[:id])
  @question =  Question.new(params[:question])
  @survey.questions << @question
  if @question.save
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    @errors = @question.errors.full_messages.to_sentence
    erb :"questions/new"
  end
end

post "/surveys/:id/questions/complete" do
  @survey = Survey.find(params[:id])
  @question = @survey.questions << Question.new(params[:question])
  if @question.save
    redirect "/surveys/#{@question.survey_id}"
  else
    @errors = @question.errors.full_messages.to_sentence
    erb :"questions/new"
  end
end

