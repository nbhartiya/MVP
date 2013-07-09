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
    $(".the-images").empty()
    $.each(@list, (index, image) ->
    	$(".the-images").append("<div class='item'><div class='fields'><input type='hidden' value='#{image.url}' name='event[images_attributes][#{index}][image]'><img src='#{image.url}'><input id='event_images_attributes_0__destroy' name='event[images_attributes][#{index}][_destroy]' type='hidden' value='false'><a href='#' onclick='remove_fields(this); return false;'>remove</a></div></div>
")	
    )