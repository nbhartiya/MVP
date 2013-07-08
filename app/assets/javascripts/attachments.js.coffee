filepicker.setKey('Aes1cg6GhQdWuMMT54dnJz')

$(".GetFilepicker").click ->
	window.imageAttachments.pick()
	return false

window.imageAttachments = 
  list: []
  pick: ->
    filepicker.pickMultiple
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
    ,((FPFile) =>
    	$.each(FPFile, (index, image) =>
      	@list.push(image)
      )
      @add()
    )
  add: ->
    $.each(@list, (index, image) ->
    	$(".the-images").append("<div class='fields'><input type='hidden' value='#{image.url}' name='event[images_attributes][#{index}][image]'><img src='#{image.url}'><div class='control-group string optional event_images_title'><div class='controls'><input class='string optional' id='event_images_attributes_0_title' name='event[images_attributes][#{index}][title]' placeholder='title' size='50' type='text'></div></div><div class='control-group string optional event_images_description'><div class='controls'><input class='string optional' id='event_images_attributes_0_description' name='event[images_attributes][#{index}][description]' placeholder='caption' size='50' type='text'></div></div><input id='event_images_attributes_0__destroy' name='event[images_attributes][#{index}][_destroy]' type='hidden' value='false'><a href='#' onclick='remove_fields(this); return false;'>remove</a></div>
")	
    )