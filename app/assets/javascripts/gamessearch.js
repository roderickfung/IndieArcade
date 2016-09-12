$(document).ready(function(){
  $(document).on('turbolinks:load', function() {
    $("#search").on('keyup', function(e){
      e.preventDefault();
      var searchTerm = $("#search").val();
      var url = "/games.js"
      $.get({
        url: url,
        data: { search: searchTerm }
      });
    });
  });
});
