$(document).ready(function() {
  $('.standardselect').each(function() {
    $(this).select2();
  });

  $('.tagselect').each(function() {
    var placeholder = $(this).data('placeholder');
    var url = $(this).data('url');
    var saved = $(this).data('saved');
    
    $(this).select2({
      tags: true,
      placeholder: placeholder,
      minimumInputLength: 1,
      initSelection : function(element, callback){
        element.val("");
        saved && callback(saved);
      },
      ajax: {
        url: url,
        dataType: 'json',
        data:    function(term) { return { q: term }; },
        results: function(data) { return { results: data }; }
      },
      createSearchChoice: function(term, data) {
        if ($(data).filter(function() {
          return this.name.localeCompare(term)===0;
        }).length===0) {
          return { id: term, name: term };
        }
      },
      formatResult: function(item, page){ 
        return item.name; 
      },
      formatSelection: function(item, page){ 
        return item.name; 
      }
    });
  }).select2('val', []);
});
