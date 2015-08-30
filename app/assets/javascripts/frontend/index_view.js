window.Photog = window.Photog || {};

window.Photog.indexView = {
  init: function() {
    this.initGrid(); 
    this.initTags(); 
  },

  initTags: function() {
    var activeFilter = this.getParameterByName('tagged');
    $('#filters span').on('click', function() {
      $(this.parentElement).toggleClass('active');
    });

    if (activeFilter) {
      $('#filters').addClass('active');
      $('#filters').find('.tag:contains('+activeFilter+')').addClass('active');
    }
  },

  getParameterByName: function(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
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
