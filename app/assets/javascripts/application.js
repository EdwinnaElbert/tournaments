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

function set_score(team_id, match_id, score) {
  $.ajax({
    url: `/scores`,
    method: 'POST',
    dataType: 'json',
    data: {
      team_id: team_id,
      match_id: match_id,
      score: score
    }
  })
}

function generate_random_scores(tournament_id) {
  $.ajax({
    url: `/scores/generate_random`,
    method: 'POST',
    dataType: 'json',
    data: { tournament_id: tournament_id  }
  }).success( function () {
    window.reload()
   }
  )
}
