//= require jquery
//= require jquery_ujs
//= require imagesloaded.pkgd.min
//= require isotope.pkgd
//= require_tree ./frontend
$(function(){
  var currentView = $('#content').attr('class');
  window.Photog[currentView+'View'].init();
});
