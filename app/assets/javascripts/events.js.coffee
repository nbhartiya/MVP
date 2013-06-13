# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#event-carousel").carousel interval: 6000

  $(".heart_this a").click ->
    if $(this).hasClass("black")
      $(this).removeClass "black"
      $(this).addClass "orange"
    else
      $(this).removeClass "orange"
      $(this).addClass "black"

  $(document).on "click", "#ticket_purchase", ->
    $("#new_charge").submit()


  $(".listing-card").mouseover ->
    $(this).find(".listing-card-text").css "bottom", "110px"
    $(this).find("tr.bottom").show 500

  $(".listing-card").mouseleave ->
    $(this).find("tr.bottom").hide 0.000001	
    $(this).find(".listing-card-text").css "bottom", "70px"
