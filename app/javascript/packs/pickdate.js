var moment = require('moment');

window.date_pick = function() {

  var start = moment().subtract(29, 'days');
  var end = moment();

  function cb(start, end) {
    $('date_field').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
  }

  $('#date_field').daterangepicker({
    autoUpdateInput: false,
    locale: { cancelLabel: 'Clear'},
    startDate: start,
    endDate: end,
    ranges: {
      'Today': [moment(), moment()],
      'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
      'Last 7 Days': [moment().subtract(6, 'days'), moment()],
      'Last 30 Days': [moment().subtract(29, 'days'), moment()],
      'This Month': [moment().startOf('month'), moment().endOf('month')],
      'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
    }
  }, cb);

  cb(start, end);

  $('#date_field').on('apply.daterangepicker', function(ev, picker) {
    $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
  });

  $('#date_field').on('cancel.daterangepicker', function(ev, picker) {
    $(this).val('');
  });

}

$(document).on('turbolinks:load',function(){
  date_pick();
});
