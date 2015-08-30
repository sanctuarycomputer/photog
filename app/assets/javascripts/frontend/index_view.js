window.Photog = window.Photog || {};

window.Photog.indexView = {
  init: function() {
    this.initGrid();
    this.initNav();
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

  initNav: function() {
    var header = $('#content.index header');
    var headerHeight = header.height();
    var nav = $('nav.index');
    var navHeight = nav.height();


    $(document).on("scroll", function(ev){
      nav.toggleClass("down", ($(window).scrollTop() > headerHeight));
      nav.toggleClass("scrolled", ($(window).scrollTop() > headerHeight));
    })

  }

}
