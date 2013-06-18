# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  $(".campaign-card-lead-name").tooltip()

  $(".user-card-name").tooltip()

  $(".single-following").mouseover ->
    $(this).find(".user-first-row").css "bottom", "174px"
    $(this).find(".user-second-row").slideDown "900"

  $(".single-following").mouseleave ->
    $(this).find(".user-second-row").hide()	
    $(this).find(".user-first-row").css "bottom", "80px"

  $(".single-campaign").mouseover ->
    $(this).find(".campaign-first-row").css "bottom", "170px"
    $(this).find(".campaign-second-row").slideDown "900"

  $(".single-campaign").mouseleave ->
    $(this).find(".campaign-second-row").hide()	
    $(this).find(".campaign-first-row").css "bottom", "76px"
