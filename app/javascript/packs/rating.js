$(document).on('turbolinks:load',function(){

  $('#rating').raty({
    target: '#review_star',
    targetType:   'score',
    targetKeep:   true,

    scoreName: 'asset[rating]',
    half: false,
  });

	$("#rating_check").on("click", function(){

      $(this).text('I dont want to leave a rating');
      $("#rating").hide("slow");

      $('#rating').raty({
      	targetScore: ''
      });

    });
});
