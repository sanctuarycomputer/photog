$(document).ready(function() {
  var set_positions = function() {
    $('.sortable-item').each(function(i){
      $(this).attr("data-pos",i+1);
    });
  }

  set_positions();

  $('.sortable').sortable();

  $('.sortable').sortable().bind('sortupdate', function(e, ui) {
    // array to store new order
    updated_order = []
    // set the updated positions
    set_positions();
    // populate the updated_order array with the new task positions
    $('.sortable-item').each(function(i){
      updated_order.push( $(this).data("id") );
    });

    // send the updated order via ajax
    $.ajax({
      type: "PUT",
      url: '/admin/order_images_in_tag',
      data: { order: updated_order, tag_id: $('.sortable').data("tag-id") }
    });
  });
});
