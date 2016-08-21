$(document).on('ready page:load', function () {
  $(function() {
    // $("#table-data th a, #table-data .pagination a").on("click", function() {
    //   $.getScript(this.href);
    //   return false;
    // });
    $("#links_search input").keyup(function() {
      $.get($("#links_search").attr("action"), $("#links_search").serialize(), null, "script");
      return false;
    });
  });

  $(".alert").fadeOut(5000);

  $(document).on('click', '.clr_srch_box', function(){
    $('#search').val('')
  });
});