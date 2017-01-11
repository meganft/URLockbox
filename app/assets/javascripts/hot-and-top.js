$(document).ready(function(){
  $.get("https://sheltered-ocean-18171.herokuapp.com/api/v1/hotreads").then(markHotReads)
});

function markHotReads(hotReads) {
  $("#links-list").children().each(function() {

    var url = $(this).find('.link-url').text().split(": ").pop()


    if (url == hotReads.url[0]) {
      $(this).addClass('hot-read')
    } else if(hotReads.url.includes(url)) {
      $(this).addClass('top-read')
    }
  });
}
