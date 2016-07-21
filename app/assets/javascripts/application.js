// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require products
//= require tickets
//= require modernizr
//= require maskMoney.min
//= require util
//= require responsive-tables
//= require prefixfree.min
//= require flash_message
//= require dist/jquery.ellipsis
//= require js/foundation-datepicker.min
//= require js/locales/foundation-datepicker.pt-br

$(document).on('ready page:load', function () {
  //activating foundation
  $(function() {
    $(document).foundation();
  });
  //setting up auto closing message boxes
  $(".alert-box").delay(4000).fadeOut(1000);
  //setting up ellipsis for products title
  $(".product-title").ellipsis({
    row: 1
  });
});
