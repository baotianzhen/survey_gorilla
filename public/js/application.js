$(document).ready(function() {
	$("#user-hud").on("click", "#new-hud", function(e) {
		e.preventDefault();
		// $("#create-popup").removeClass("hide");
		$("#create-popup").slideDown("slow", function() {

		});
		$("#create-popup").addClass("hud-popup");
	})

	$("#user-hud").on("click", "#login-hud", function(e) {
		e.preventDefault();
		// $("#login-popup").removeClass("hide");
		$("#login-popup").slideDown("slow", function() {

		});
		$("#login-popup").addClass("hud-popup");
	})
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
