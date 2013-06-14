# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.learn_more_link').tooltip()

$(document).ready ->
  $("#myCarousel").carousel interval: 6000