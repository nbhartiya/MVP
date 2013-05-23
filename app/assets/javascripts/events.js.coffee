# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".listing-card").mouseover ->
    $(this).find(".listing-card-text").css "bottom", "132px"
    $(this).find("tr.bottom").show 0.000001

  $(".listing-card").mouseleave ->
    $(this).find("tr.bottom").hide 0.000001	
    $(this).find(".listing-card-text").css "bottom", "92px"