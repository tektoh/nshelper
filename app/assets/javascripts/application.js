//= require jquery2
//= require jquery_ujs
//= require react
//= require react_ujs
//= require_tree ./components
//= require turbolinks
//= require google-analytics-turbolinks
//= require bootstrap-material-design
//= require bootstrap-sprockets

$(document).on('ready page:load', function() {
  $.material.init();
});
