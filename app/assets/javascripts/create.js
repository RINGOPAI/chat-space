$(function() {
// $(document).on('turbolinks:load',function() {

function appendNewMessage(message) {
  var imageUrl = ``;
  if (message.image.url !== null) {
    imageUrl = `<img src= "${message.image.url}">`;
  }

  var html = `<div class = "group__message--name">
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
              </div>`

  $(".group__message").append(html);
  $(".group__message").animate({scrollTop: $(".group__message")[0].scrollHeight}, 500);
}

  $("#new_message").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = location.pathname;

    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data) {
      appendNewMessage(data);
      $(".text_field").val("");
      $(".file_field").val("");
      $(".button").prop("disabled", false);
    })
    .fail(function() {
      alert("送信に失敗しました");

    })

  });
});
