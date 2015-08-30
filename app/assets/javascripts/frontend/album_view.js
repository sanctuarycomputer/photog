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
    var initialSlideIndex = this.getParameterByName('image');

    if (initialSlideIndex.length === 0) {
      initialSlideIndex = "0"; 
    }

    initialSlideIndex = parseInt(initialSlideIndex);

     var mySwiper = new Swiper ('.swiper-container', {
      nextButton: '.swiper-button-next',
      initialSlide: initialSlideIndex,
      prevButton: '.swiper-button-prev',
      preloadImages: false,
      lazyLoading: true,
      loop: true,
      speed: 600,
      runCallbacksOnInit: false,
      onSlideChangeEnd: this.slideDidChange.bind(this)
    }) 
  },

  getParameterByName: function(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
  },

  slideDidChange: function(swiper) {
    swiper.fixLoop();
    this.countElem.text(swiper.activeIndex);
  }
}
