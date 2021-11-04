$.fn.rating_binder = function() {
  $('#rating').raty({

    targetType: 'score',
    targetKeep: true,
    target: '#review_star',
    half: false,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png',

  });

  $("#rating_check").on("click", function(){

    $(this).text('I don\'t want to leave a rating');
    $("#rate").hide("slow");

    $('#rating').raty({
      targetType: 'score',
      targetKeep: true,
      target: '#review_star',
      targetScore: null
    });

  });

  $('#rating_display').raty({

    readOnly: true,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png',

  });
}

$(document).on('turbolinks:load',function(){
  $.fn.rating_binder();
});
