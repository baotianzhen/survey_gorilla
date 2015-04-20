get '/surveys/:id/submissions/new' do
	@user = validate_user
	"this is a submission for survey #{params[:id]}"
	@survey =	Survey.find(params[:id])
	@questions = @survey.questions
  @submission = Submission.create(responder_id: session[:id], survey_id: @survey.id)
 erb :'submissions/new'
end


# get '/submissions/:id' do
# 	@submission = Submission.find(params[:id])
# 	@responses = @submission.responses
# 	@survey = @submission.survey
# 	@questions = @survey.questions
# 	erb :'/surveys/show'
# end

post '/submissions/:id' do
	@submission = Submission.find(params[:id])
	@responses = @submission.responses
	@survey = @submission.survey
	@questions = @survey.questions
	if request.xhr?
		puts "ill do this later"
	else
		params[:answers].each do |question, answer|
	  @submission.responses <<  Response.create!(submission_id: @submission.id, choice_id: answer)
		end
		redirect '/'
 	end
end
