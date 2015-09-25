//= require jquery
//= require jquery_ujs
//= require imagesloaded.pkgd.min
//= require isotope.pkgd
//= require swiper.jquery.min
//= require_tree ./frontend
//= require fastclick
$(function(){
  new FastClick(document.body);
  var currentView = $('#content').attr('class');
  window.Photog[currentView+'View'].init();
  $content = $('#content');
  $content.addClass('loaded');
  
  // Back Buttons
  var back = $('.trigger-back');
  back.on('click', function() {
    var referrerIsLocal = document.referrer.indexOf(location.protocol + "//" + location.host) === 0;

    if (referrerIsLocal) {
      window.history.back(); 
    } else {
      window.location.href = location.protocol + "//" + location.host;
    }
  });
});
