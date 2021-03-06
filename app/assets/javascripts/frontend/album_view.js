window.Photog = window.Photog || {};

window.Photog.albumView = {
  init: function() {
    console.log('Init Album View');
    this.initPageCount();
    this.initSwiper();
    this.caption = $('#caption');
    this._ensureCaptionUpToDate();

    this.swiperNextButton = $('.swiper-button-next');
    this.swiperPrevButton = $('.swiper-button-prev');
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
      speed: 300,
      runCallbacksOnInit: false,
      onSlideChangeEnd: this.slideDidChange.bind(this)
    })

    imageCoverLeft = $('.image-cover.left');
    imageCoverRight = $('.image-cover.right');

    $(document).on("keydown", function (e) {
      e.preventDefault();
      switch(e.which) {
        case 37:
          $(".swiper-button-prev").click();
        break;
        case 122:
          $(".swiper-button-prev").click();
        break;
        case 39:
          $(".swiper-button-next").click();
        break;
        case 120:
          $(".swiper-button-next").click();
        break;
        default: return;
      }
    });

    imageCoverLeft.on("click", function(){
      $(".swiper-button-prev").click();
    })

    imageCoverRight.on("click", function(){
      $(".swiper-button-next").click();
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
    this._ensureCaptionUpToDate();
  },

  _ensureCaptionUpToDate: function() {
    var newCaption = $('.swiper-slide-active').get(0).dataset.caption;
    this.caption.text(newCaption);
  }
}
