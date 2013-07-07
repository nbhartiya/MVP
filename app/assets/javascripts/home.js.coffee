$("#home-carousel").carousel interval: 6000

$(".step").mouseover ->
  $(".step-description", this).slideDown "400"

$(".attention-getter").mouseover ->
  $("#home-carousel").carousel "pause"

$(".attention-getter").mouseleave ->
  $("#home-carousel").carousel "cycle"

$(".how-it-works-button").click ->
  $("#how-it-works-detail").collapse "show"