$(document).on('turbolinks:load',function(){

  $("#review").rating({
    "click": function(e) {
        console.log(e);
        $("#starsInput").val(e.stars);
    }
  })

});
