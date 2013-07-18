$("#home-carousel").carousel interval: 6000

$(".attention-getter").mouseover ->
  $("#home-carousel").carousel "pause"

$(".attention-getter").mouseleave ->
  $("#home-carousel").carousel "cycle"

$(".how-it-works-button").click ->
  $("#how-it-works-detail").collapse "show"