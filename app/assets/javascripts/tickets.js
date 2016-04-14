// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
	$('#ticket_event_day').fdatepicker({
		//initialDate: '02-12-1989',
		format: 'mm-dd-yyyy',
		disableDblClickSelection: true,
    language: 'pt-br'
	});
});

$(function(){
  $('#ticket_event_time').fdatepicker({
		format: 'hh:ii',
		disableDblClickSelection: true,
		language: 'pt-BR',
		pickTime: true
	});
});
