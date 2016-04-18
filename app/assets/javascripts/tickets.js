// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load', function () {
    $('#ticket_event_datetime').fdatepicker({
  		format: 'dd-mm-yyyy hh:ii',
  		disableDblClickSelection: true,
  		language: 'pt-br',
  		pickTime: true
  	});
});
