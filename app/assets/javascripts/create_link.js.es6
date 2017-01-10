var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){


  function updateLinkOnRead(e) {
    var targetLinkId = '#link-' + String(e)
    debugger;
    var $target = $(targetLinkId)
    $target.addClass('read')
  }


  function updateLinkToUnread(event) {
    var targetLinkId = '#link-' + String(e)
  }


  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( updateLinkOnRead.bind(this, linkId) );
  })




  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    }).then( updateLinkToUnread );
  })
})
