$(function() {
  $(".group__form").on("submit", function(e) {
    e.preventDefault();
    var inputText = $(".text_field").val();
    var inputFile = $("").val();
    console.log(inputText);

  });
});
