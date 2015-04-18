get '/surveys/:id/submissions' do
	"this is a submission for survey #{params[:id]}"
	@survey =	Survey.find(params[:id])
	@questions = @survey.questions
  @submission = Submission.create
 erb :'submissions/new'
end

post '/submissions/:id' do
	@submission = Submission.find(params[:id])
	if request.xhr?
		puts "ill do this later"
	else
		params[:answers].each do |question, answer|
      @submission.responses <<  Response.create!(submission_id: @submission.id, choice_id: answer)
		end
		redirect '/'
 	end
end
