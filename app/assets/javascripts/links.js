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

  // $(document).on('click', '#tag_cloud a', function(){
  //   $(this).css('background','red')
  // });

  $('#link_tag_list').tagsInput({
   'height':'50px',
   'interactive':true,
   'defaultText':'add a tag',
   'delimiter': [','],   // Or a string with a single delimiter. Ex: ';'
   'removeWithBackspace' : true,
   'minChars' : 0,
   'maxChars' : 0, // if not provided there is no limit
   'placeholderColor' : '#666666'
  });
});