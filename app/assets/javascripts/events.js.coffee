# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".listing-card").mouseover ->
#    $(this).addClass "highlight"
    $(this).find("tr.bottom").slideDown 200

  $(".listing-card").mouseleave ->
#    $(this).removeClass "highlight"
    $(this).find("tr.bottom").fadeOut 1