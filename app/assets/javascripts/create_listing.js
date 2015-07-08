$("a[type='submit']").on("click", function (event) {
  event.preventDefault();
  $(this).parent("form").submit();
});
