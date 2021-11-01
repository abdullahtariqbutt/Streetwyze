$(document).ready(function(){

	var signin_eye = document.getElementById("signIn_pswd");
	var eye = document.getElementById("signUp_pswd");
	var confirm_eye = document.getElementById("signUp_c_pswd");

	var x = ""
	var show_eye = ""
	var hide_eye = ""

	$("#eye").on("click", function(){
		x = document.getElementById("password");
  		show_eye = document.getElementById("show_eye");
		hide_eye = document.getElementById("hide_eye");

		hide_eye.classList.remove("d-none");

		if (x.type === "password"){
	  	x.type = "text";
	  	show_eye.style.display = "none";
	  	hide_eye.style.display = "block";
		}
		else{
	  	x.type = "password";
	  	show_eye.style.display = "block";
	  	hide_eye.style.display = "none";
		}
  });

  $("#c_eye").on("click", function(){
		x = document.getElementById("confirm_password");
  		show_eye = document.getElementById("c_show_eye");
		hide_eye = document.getElementById("c_hide_eye");

		hide_eye.classList.remove("d-none");

		if (x.type === "password"){
	  	x.type = "text";
	  	show_eye.style.display = "none";
	  	hide_eye.style.display = "block";
		}
		else{
	  	x.type = "password";
	  	show_eye.style.display = "block";
	  	hide_eye.style.display = "none";
		}
  });

});
