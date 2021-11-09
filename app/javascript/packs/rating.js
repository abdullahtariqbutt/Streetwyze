window.rating_binder = function() {
  $('#rate #rating').raty({

    targetType: 'score',
    targetKeep: true,
    target: '#review_star',
    half: false,

    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png',

  });

  $("#rating_check").on("click", function(){

    $(this).text('I don\'t want to leave a rating');
    $("#rate").hide("slow");

    $('#rate #rating').raty({
      targetType: 'score',
      targetKeep: true,
      target: '#review_star',
      targetScore: null,

      numberMax: 5,
    });

  });

  $('#story #rating_display').raty({

    readOnly: true,
    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png',

  });

  $('#map_asset #rating_display').raty({

    readOnly: true,
    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png',

  });
}

$(document).on('turbolinks:load',function(){
  rating_binder();
});
