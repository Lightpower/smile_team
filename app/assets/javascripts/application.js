// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $("a.accepted").live("click", function(e) {
    ST.invites.accept(this);
    e.preventDefault();
  });
  $("a.rejected").live("click", function(e) {
    ST.invites.reject(this);
    e.preventDefault();
  });
  $("a.pending").live("click", function(e) {
    ST.invites.pending(this);
    e.preventDefault();
  });
});