# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on 'click', '.usersignup', (e) ->
  e.preventDefault()
  $('#new_user').submit()

$(document).on 'click', '.userlogin', (e) ->
  e.preventDefault()
  $('.new_user_session').submit()