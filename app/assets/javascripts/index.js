$(function(){
// $(document).on('turbolinks:load',function() {

  function addSearchedUsers(user) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.name }</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  function addNoUsers() {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">該当するユーザーはいません</p>
                </div>`
    $("#user-search-result").append(html);
  }

  function emptyResult() {
    $("#user-search-result").empty();
  }

  function addUserList(addUser) {
    var addUserName = addUser.getAttribute("data-user-name");
    var addUserId = addUser.getAttribute("data-user-id");

    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${ addUserId }'>
                    <p class='chat-group-user__name'>${ addUserName }</p>
                    <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`

    $("#group-user-list").append(html);
  }

  $("#user-search-field").on("keyup", function(e) {
    var input = $("#user-search-field").val();
    var space = /\s+/g;

    if (input.match(space)) {
      emptyResult();
    } else if (input !== "") {
      $.ajax({
        type: "GET",
        url: '/users',
        data: { keyword: input },
        dataType: 'json',
      })

      .done(function(users) {
        emptyResult();
        if (users.length !== 0){
          users.forEach(function(user) {
            addSearchedUsers(user);
          });
        } else {
          addNoUsers();
        }
      })
      .fail(function() {
        alert("検索に失敗しました");
      })
    } else {
      emptyResult();
    }
  });

  $(document).on("click", ".chat-group-user__btn--add", function(){
    console.log("追加クリックされた");
    var addUser = $(this).get(0);
    console.log(addUser);
    $(this).parent().remove();
    addUserList(addUser);
  });

  $(document).on("click", ".chat-group-user__btn--remove", function(){
    console.log("削除クリックされた");
    $(this).parent().remove();
  });

});
