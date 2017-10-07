$(function() {

function appendNewMessage(message) {
  var html = `<div class = "group__message--name">
                ${message.user.name}
              </div>
              <dic class = "group__message--time">
                ${message.created_at}
              </div>
              <div class = "group__message--text">
                ${message.body}
              </div>
              <div class = "group__message--image">
                <% if message.image? %>
                  <%= image_tag(${message.image.url}) %>
              </div>`

  $(".group__message").append(html);
  // $(".group__message").animate({scrollTop: 0});
}

  $(".group__form").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = location.pathname;
    // console.log(this);
    // console.log(url);

    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(message) {
      appendNewMessage(message);
      console.log("done");
    })
    .fail(function() {
      alert("送信に失敗しました");

    })

  });
});
