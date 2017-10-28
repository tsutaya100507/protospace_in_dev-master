$(document).on('turbolinks:load', function() {
  var $heart = $(".like-button");
  var $likesum = $("#heart-sum")
  like_function(#{@prototype.id}, $(this), $heart, $likesum)
});

function like_functuon(id, button, heart, sum){
  if (button,hasClass("decrement")){
    $.ajax({
      url:
    })
  }
}


// $(document).on('turbolinks:load', function() {
//   $(".like-button").html("<%= j(render partial: 'like', locals: { prototype: @prototype, likes: @likes, like: @like}) %>");

// $("#like-buttons").html("<%= j(render partial: 'like', locals: { micropost: micropost, likes: @likes }) %>");
// }
