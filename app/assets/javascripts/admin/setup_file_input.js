$(document).ready(function() {
  $('input[type="file"]').each(function() {

    this.addEventListener('change', function(e) {
      var file = this.files[0];
      var input = this;

      var reader = new FileReader();
      reader.onload = function(e) {
        var dataURL = reader.result;

        var hintsImg = $(input).parent().find('p.inline-hints img');
        hintsImg[0].src = dataURL; 
      }

      reader.readAsDataURL(file);
    });


  });
});
