//= require jquery
//= require jquery_ujs
//= require imagesloaded.pkgd.min
//= require magic.rows.min
//= require swiper.jquery
//= require_tree ./frontend
//= require fastclick

new FastClick(document.body);

$(window).on('load',function(){
  $content = $('#content');
  window.Photog[$content.attr('class') + 'View'].init();
  $content.addClass('loaded');

  if (!!('ontouchstart' in window)) {
    $content.addClass('touch');
  }
});
