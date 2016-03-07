$(document).on('ready page:load', function () {
  console.log($('#links_search').length)
  $(function() {
    // $("#table-data th a, #table-data .pagination a").on("click", function() {
    //   $.getScript(this.href);
    //   return false;
    // });
    $("#links_search input").keyup(function() {
      console.log('hiiiii')
      $.get($("#links_search").attr("action"), $("#links_search").serialize(), null, "script");
      return false;
    });
  });

  $(".alert").fadeOut(5000);
});