// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require vendors.bundle
//= require scripts.bundle
//= require rails.validations
//= require bootstrap-datepicker

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

function generate_game(tournament_id) {
  alert(tournament_id)
  $.ajax({
    url: `/tournaments/${tournament_id}/games`,
    method: 'POST',
    dataType: 'json'
  })
    //.done(function(data) {
      // console.log(data.ev.event_type);
      // toastr.info(data.ev.message);
      //
      // if (data.ev.event_type === 'new_message') {
      //   return $(".messages").attr("data-message-count", data.unread_msgs);
      // } else {
      //   return $(".events").attr("data-notification", "true");
      // }
  // });
}
