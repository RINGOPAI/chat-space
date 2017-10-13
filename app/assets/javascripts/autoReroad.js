$(function() {
  function appendNewMessage(message) {
    var imageUrl = ``;
    if (message.image.url !== null) {
      imageUrl = `<img src= "${message.image.url}">`;
    }

    var html = `<div class = "group__message--content" data-id = "${ message.id }">
                <div class = "group__message--name">
                  ${ message.name }
                </div>
                <div class = "group__message--time">
                  ${ message.created_at }
                </div>
                <div class = "group__message--text">
                  ${ message.text }
                </div>
                <div class = "group__message--image">
                  ${ imageUrl }
                </div>
                </div>`

    $(".group__message").append(html);
  }

  setInterval(autoUpdate, 5000);

  function autoUpdate() {
    var message_id = $(".group__message--content:last").data("id");

    $.ajax({
      type: "GET",
      url: location.href,
      data: { message: {id: message_id} },
      dataType: 'json'
    })
    .always(function(data) {
      if(Object.keys(data).length !== 0) {
        $.each(data, function(i, data) {
          appendNewMessage(data);
        });
        $(".group__message").animate({scrollTop: $(".group__message")[0].scrollHeight}, 500);
      }
    })
  }

});
