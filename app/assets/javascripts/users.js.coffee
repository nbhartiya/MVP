# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(document).on "click", ".userlogin", ->
    $("#new_user_session").submit()

  $(document).on "click", ".usersignup", ->
    $("#new_user").submit()

  $(document).on "click", ".newpass", ->
    $("#new_pass").submit()

  $(".userCard").mouseover ->
    $(this).find(".user-card-text").css "bottom", "110px"
    $(this).find("tr.bottom").show 500

  $(".userCard").mouseleave ->
    $(this).find("tr.bottom").hide 0.000001	
    $(this).find(".user-card-text").css "bottom", "70px"