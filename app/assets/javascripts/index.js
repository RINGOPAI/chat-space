$(document).on('turbolinks:load',function() {

  function addSearchedUsers(user) {
    var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${ user.name }</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${ user.id } data-user-name=${ user.name }>追加</a>
                </div>`

    $("#user-search-result").append(html);
  }

  function resultEmpty() {
    $("#user-search-result").empty();
  }


  $("#user-search-field").on("keyup", function(e) {
    var input = $("#user-search-field").val();
    var space = /\s+/g;

    if (input.match(space)) {
      resultEmpty();
    } else if (input !== "") {
      $.ajax({
        type: "GET",
        url: '/users',
        data: { keyword: input },
        dataType: 'json',
      })

      .done(function(users) {
        if (users.length !== 0){
          resultEmpty();
          users.forEach(function(user) {
            addSearchedUsers(user);
          });
        }
      })
      .fail(function() {
        alert("検索に失敗しました");
      })
    } else {
      resultEmpty();
    }
  });
});
