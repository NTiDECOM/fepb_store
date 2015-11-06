// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function set_path_for_new_btn() {
  var sel_val = $('#product').val();
  $('#product_link_to').attr('href', sel_val)
}