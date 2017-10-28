$(function(){
  function buildHTML(comment){
    var html = `<a href=${comment.id}>${comment.user_name}</a>
    ${comment.text}`
    return html;
  }
  console.log('hoge')
  $('#new_comment').on('submit', function(e){
    console.log(formData)
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    console.log(formData)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});
