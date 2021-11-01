$(document).on('turbolinks:load',function(){

	stars = document.getElementById("rating");
	check = document.getElementById("rating_check");

	$(check).on("click", function(){
      $(this).text($(this).text() == 'I want to leave a rating' ? 'I dont want to leave a rating' : 'I want to leave a rating');
      $(stars).toggle("slow");
    });    
});
