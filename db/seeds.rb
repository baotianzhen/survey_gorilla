User.destroy_all
User.create!(username: "Anonymous", email: "anonymous@unknown.com", password: "123456")
User.create!(username: "ryan", email: "ryan@test.com", password: "123456")

Survey.create!(author_id: 1, title: "newsurvey")

Question.create!(prompt: 'Do you like bananas?', survey_id: 1)

Choice.create!(body: 'Agree', question_id: 1)
Choice.create!(body: 'Disagree', question_id: 1)

Question.create!(prompt: 'Do you have any bananas to spare?', survey_id: 1)

Choice.create!(body: 'Agree', question_id: 2)
Choice.create!(body: 'Disagree', question_id: 2)
