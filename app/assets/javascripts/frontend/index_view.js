window.Photog = window.Photog || {};

window.Photog.indexView = {
  init: function() {
    this.initGrid();
    this.initSlideShow();
    this.initNav();
    this.initTags();
    this.initViewToggle();
    this.scrollDown();
  },

  initSlideShow: function() {
    slideshowLength = $('header').length;
    currentIndex = 0
    $($('header')[currentIndex]).toggleClass('transparent');

    setInterval(function(){
      $($('header')[currentIndex]).toggleClass('transparent');
      if(currentIndex === slideshowLength - 1){
        currentIndex = 0
      }
      else currentIndex++
      $($('header')[currentIndex]).toggleClass('transparent');
    }, 8000)
  },

  initViewToggle: function() {
    $('.view-toggle').on('click', function() {
      if (this.getParameterByName('grid').length) {
        var newUrl = this.removeURLParameter(window.location.href, 'grid');
        window.location.href = newUrl;
      } else {
        var newUrl = this.updateQueryStringParameter(window.location.href, 'grid', 'photos');
        window.location.href = newUrl;
      }
    }.bind(this));
  },

  initTags: function() {
    var activeFilter = this.getParameterByName('tagged');
    $('#filters .filter-work').on('click', function() {
      $(this.parentElement).toggleClass('active');
    });

    if (activeFilter) {
      $('#filters').find('.tag a:contains('+activeFilter.toUpperCase()+')').addClass('active');
    }
  },

  scrollDown: function(){
    var headerHeight = $('#content.index header').height();
    $('.down-arrow').on('click', function(){
      $('html, body').animate({
          scrollTop: headerHeight
      }, 1500);
    })
  },

  removeURLParameter: function(url, parameter) {
    var urlparts= url.split('?');   
    if (urlparts.length>=2) {

      var prefix= encodeURIComponent(parameter)+'=';
      var pars= urlparts[1].split(/[&;]/g);

      for (var i= pars.length; i-- > 0;) {    
        if (pars[i].lastIndexOf(prefix, 0) !== -1) {  
          pars.splice(i, 1);
        }
      }

      url= urlparts[0]+'?'+pars.join('&');
      return url;
    } else {
      return url;
    }
  },

  updateQueryStringParameter: function(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
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
  },

  initNav: function() {
    var header = $('#content.index header');
    var headerHeight = header.height();
    var nav = $('nav.index');
    var navHeight = nav.height();

    $(document).on("scroll", function(ev){
      if(header.length){
        nav.toggleClass("down", ($(window).scrollTop() > headerHeight));
        nav.toggleClass("scrolled", ($(window).scrollTop() > headerHeight));
      }
    })

  }
}
