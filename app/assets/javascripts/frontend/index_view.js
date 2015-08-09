window.Photog = window.Photog || {};

window.Photog.indexView = {
  init: function() {
    this.initGrid(); 
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
  }
}
