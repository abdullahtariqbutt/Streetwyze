$(document).on('turbolinks:load', function(){

  $(".emoji-div").each(function(i,v) {
    $(v).emoji();
  });

  $(".emoji-div").on("click", function(){
    $(this).siblings("input").val($(this).attr("value"));
  });

});
