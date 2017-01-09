var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

// this function will be trigged when read button is clicked
  function updateLinkOnRead(event) {
    $('#link-' + this).addClass('read')
  }


// this function will be trigged when unread button is clicked
  function updateLinkOnUnread(event) {
    $('#link-' + this).removeClass('read')
  }


  // will perform this operation when read is clicked
  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then(updateLinkOnRead.bind(linkId));
  })


// will perform this operation when unread is clicked
  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    }).then(updateLinkOnUnread);
  })
})
