$(document).ready(function() {

  $('#filter-text').on('keyup', filterText)
  $('#filter-unread').on('click', filterUnread)
  $('#filter-read').on('click', filterRead)
});

function filterText(e) {
  var filter = $( "#filter-text" ).val();
  $( "#links-list" ).children().each(function(){

    var title = $( this ).find( '.link-title' ).text();
    var url = $( this ).find( '.link-url' ).text();

    if(title.includes( filter ) || url.includes( filter )){
      $( this ).show()
    }else {
      $( this ).hide()
    };
  });
}

function filterUnread(e) {
  $( '#links-list').children().each(function() {

    debugger;

    var read = $( this ).find( '.link_read' ).text().split(": ").pop();
    if(read == 'false') {
      $( this ).show()
    }else {
      $( this ).hide()
    };
  });
};

function filterRead(e) {
  $( '#links-list').children().each(function() {
    debugger;
    var read = $( this ).find( '.link_read' ).text().split(": ").pop();
    if(read == 'true') {
      $( this ).show()
    }else {
      $( this ).hide()
    };
  });
};
