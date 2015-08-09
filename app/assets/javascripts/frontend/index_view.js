window.Photog = window.Photog || {};

window.Photog.indexView = {
  init: function() {
    console.log('hi')
    this.initGrid();
    this.checkScroll();
  },

  /*
   * Init Isotope
   */
  initGrid: function() {
    var $grid = $('.grid').imagesLoaded(function() {
      $grid.isotope({
        itemSelector: '.grid-item',
        percentPosition: true,
        masonry: {
          columnWidth: '.grid-sizer'
        }
      });
    });
  },

  checkScroll: function(){
    var lastScrollTop = 0;
    var windowHeight = $(window).height()
    $(window).on("scroll", function(event){
       var st = $(this).scrollTop();
       if (st > lastScrollTop){
          if(lastScrollTop === 0){
            $('body').scrollTop(windowHeight)
          }
       } else {
          console.log('up')
       }
       lastScrollTop = st;
    });
  }
}
