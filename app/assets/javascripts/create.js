$(function() {

function appendNewMessage(message) {
  var html = `<div class = "group__message--name">
                <%= message.user.name %>
              </div>
              <dic class = "group__message--time">
                <%= message.created_at %>
              </div>
              <div class = "group__message--text">
                <%= message.body %>
              </div>
              <div class = "group__message--image">
                <% if message.image? %>
                  <%= image_tag(message.image.url) %>
              </div>`
//   .group__message--name
//     = message.user.name
//   .group__message--time
//     = message.created_at
//   .group__message--text
//     = message.body
//   .group__message--image
//     - if message.image?
//       = image_tag message.image.url
//
//         <image src= "#{message.image.url}" >

  $(".group__message").append(html);
}


  $(".group__form").on("submit", function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = location.pathname;
    console.log(url);

    $.ajax({
      type: 'POST'
      url: url
      data: 'formData'
      dataType: 'json'
    })

    .done(function(message) {
      // 個別のメッセージと同じHTML
      appendNewMessage(message);

    })
    .fail(function() {
      alert("送信に失敗しました");

    })

  });
});
