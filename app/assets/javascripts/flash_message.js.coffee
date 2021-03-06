show_ajax_message = (msg, type) ->
  $("#flash-message").html "<div id='flash-#{type}'>#{msg}</div>"
  $("#flash-#{type}").delay(5000).slideUp 'slow'

$(document).ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  type = request.getResponseHeader("X-Message-Type")
  show_ajax_message msg, type #use whatever popup, notification or whatever plugin you want