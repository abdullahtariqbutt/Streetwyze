checkFields = function(form) {
  var checks_radios = form.find('[type="radio"]'),
    checked = checks_radios.filter(':checked'),

    inputs = form.find('[type="radio"]', '[type="hidden"]').not(checks_radios).not('[type="submit"], [type="button"], [type="reset"]'),
    filled = inputs.filter(function(){
      return $.trim($(this).val()).length > 0;
    });

  if(checked.length + filled.length === 0) {
    return false;
  }
  return true;
}

$(document).on('turbolinks:load', function(){

  $('#response_form').on('submit',function(event){
    var oneFilled = checkFields($(this));

    if (oneFilled == false){
      event.preventDefault();
      alert("Fill alleast one field");
    };
  });

  $('#response_form').on('click',function(){
    $("#hit_it").removeAttr("disabled");
  });

});
