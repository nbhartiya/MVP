$(".campaign-days").tooltip()
$(".campaign-tilt").tooltip()
$(".campaign-follow").tooltip()

$(".heart").click ->
  if $(this).hasClass("campaign-follow")
    $(this).toggleClass("black").toggleClass "orange"

$(".campaign-join-button").click ->
  $(".campaign-follow").toggleClass "black"