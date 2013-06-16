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

  $(".event-stats").mouseover ->
    $("#event-carousel").carousel "pause"

  $(".event-stats").mouseleave ->
    $("#event-carousel").carousel "cycle"

  $(document).on "click", ".event-go-button", ->
    $("#event-carousel").carousel "pause"

  $(".single-event").mouseover ->
    $(this).find(".event-first-row").css "bottom", "-50%"
    $(this).find(".event-second-row").slideDown "400"

  $(".single-event").mouseleave ->
    $(this).find(".event-second-row").slideUp "400"	
    $(this).find(".event-first-row").css "bottom", "-73%"
