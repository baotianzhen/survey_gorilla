$(document).ready(function() {
	$("#user-hud").on("click", "#new-hud", function(e) {
		e.preventDefault();
		// $("#create-popup").removeClass("hide");
		$("#create-popup").slideDown("slow", function() {

		});
		$("#create-popup").addClass("hud-popup");
	});

	$("#user-hud").on("click", "#login-hud", function(e) {
		e.preventDefault();
		// $("#login-popup").removeClass("hide");
		$("#login-popup").slideDown("slow", function() {

		});
		$("#login-popup").addClass("hud-popup");
	});

	$(".surveys").on("click", "#create-survey", function(e) {
		e.preventDefault();
		console.log(this);
		var ajaxCreate = $.ajax({
			url: "/surveys/new",
			method: "get"
		})
		ajaxCreate.done(function(response) {
			$(".surveys").remove();
			$(".container").append(response);
		})
	});

	$(document).on("submit", "#new_survey", function(e) {
		e.preventDefault();
		console.log($(this).serialize);
		console.log($(this))
		var ajaxQuestion = $.ajax({
			url: "/surveys",
			method: "post",
			data: $(this).serialize()
		});
		ajaxQuestion.done(function(response){
			$("#new-survey-form").remove();
			$(".container").append(response)
		});
	});

	$(document).on("submit", "#new_question", function(e){
		e.preventDefault();
		
		console.log($(this).serialize())
		var ajaxNewQuestion = $.ajax({
			url: $("#new_question").attr("action"),
			method: "post",
			data: $(this).serialize()
		})
		$("#question_prompt").val("");
		ajaxNewQuestion.done(function(response){
			console.log(response);
		});

	});
	// $("#question-prompt").on("")
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
