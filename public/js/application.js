$(document).ready(function() {
	$(document).on("click", "#new-user", function(e) {
		e.preventDefault();
		$("#login-popup").removeClass("hide");
		$("#login-popup").addClass("hud-popup");
})
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
