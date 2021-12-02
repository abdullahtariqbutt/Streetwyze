window.asset_rating = function() {

  $('#map_asset .rating_display').raty({

    readOnly: true,
    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png'

  });

}

window.story_rating = function() {

  $('#story .rating_display').raty({

    readOnly: true,
    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png'

  });

}

window.rating_binder = function() {

  $('#rate #rating').raty({

    targetType: 'score',
    targetKeep: true,
    target: '#review_star',
    half: false,

    numberMax: 5,

    starOn: '../images/star-on.png',
    starOff: '../images/star-off.png'

  });

  $("#rating_check").on("click", function(){

    $(this).text('I don\'t want to leave a rating');
    $("#rate").hide("slow");

    $('#rate #rating').raty({
      targetType: 'score',
      targetKeep: true,
      target: '#review_star',
      targetScore: null,

      numberMax: 5

    });

  });

}

$(document).on('turbolinks:load',function(){
  asset_rating();
  story_rating();
  rating_binder();
});
