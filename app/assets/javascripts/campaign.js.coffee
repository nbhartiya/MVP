$(".campaigns .heart_this a").click ->
  if $(this).hasClass("gray")
    $(this).removeClass "gray"
    $(this).addClass "orange"
  else
    $(this).removeClass "orange"
    $(this).addClass "gray"

$(".campaign-days").tooltip()
$(".campaign-tilt").tooltip()