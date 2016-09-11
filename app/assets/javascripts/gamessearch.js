
$(document).ready(function(){
  $("#search").on('keyup', function(e){
    e.preventDefault();
    var searchTerm = $("#search").val();
    var url = "/games.js"
    $.get({
      url: url,
      data: { search: searchTerm }
    })
  })
})
