$(".campaign-days").tooltip()
$(".campaign-tilt").tooltip()
$(".campaign-follow").tooltip()

$(".campaign-join-button").click ->
  $(".campaign-follow").toggleClass "black"