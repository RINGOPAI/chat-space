$(function() {
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

  });
});
