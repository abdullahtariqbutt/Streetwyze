console.log("custom js file loaded");

$(document).ready(function(){

	$("#you").on("click", function(){
  		console.log("You clicked 19283409812374");
	});

	$("#eye").on("click", function(){
		
		var x = document.getElementById("password");

		var show_eye = document.getElementById("show_eye");
		var hide_eye = document.getElementById("hide_eye");

		hide_eye.classList.remove("d-none");

		if (x.type === "password")
		{
		  x.type = "text";
		  show_eye.style.display = "none";
		  hide_eye.style.display = "block";
		}
		else
		{
		    x.type = "password";
		    show_eye.style.display = "block";
		    hide_eye.style.display = "none";
		}

	});
	
});

console.log("Come on!!!!!");
