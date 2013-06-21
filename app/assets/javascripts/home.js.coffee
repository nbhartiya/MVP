# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

$(document).ready ->
  $("#home-carousel").carousel interval: 6000

  $(".step").mouseover ->
    $(".step-description", this).slideDown "400"

  $(".attention-getter").mouseover ->
    $("#home-carousel").carousel "pause"

  $(".attention-getter").mouseleave ->
    $("#home-carousel").carousel "cycle"