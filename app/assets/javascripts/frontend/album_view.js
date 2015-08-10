window.Photog = window.Photog || {};

window.Photog.albumView = {
  init: function() {
    console.log('Init Album View');
    this.initPageCount();
    this.initSwiper();
  },

  initPageCount: function() {
    this.countElem = $($('footer .page-count span')[0]);
  },

  initSwiper: function() {
     var mySwiper = new Swiper ('.swiper-container', {
      nextButton: '.swiper-button-next',
      prevButton: '.swiper-button-prev',
      preloadImages: false,
      lazyLoading: true,
      loop: true,
      speed: 600,
      runCallbacksOnInit: false,
      onSlideChangeEnd: this.slideDidChange.bind(this)
    }) 
  },

  slideDidChange: function(swiper) {
    swiper.fixLoop();
    this.countElem.text(swiper.activeIndex);
  }
}
