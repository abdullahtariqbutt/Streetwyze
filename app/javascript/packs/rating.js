$(document).on('turbolinks:load',function(){

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
});
