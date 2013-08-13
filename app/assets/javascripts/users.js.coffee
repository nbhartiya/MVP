$(document).on "click", ".userlogin", ->
  $("#new_user_session").submit()

#
#$(document).on "click", ".usersignup.bizbutton", ->
#  $("#new_user_biz").submit()
  #$.post('/users', $('#new_user').serialize(),
  #	(data, status) ->
  #    if data.match('Uh-oh, there was')
  #      #render this data
  #    	#TODO: Probably want to make this better later...
  #      console.log('WAHHHHH!!')
  #    else
  #      window.location='/events'
  #)

$(document).on "click", ".newpass", ->
  $("#new_pass").submit()

angular.module('Simmr').controller "UserRegisterCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]

$(document).on "click", ".foodiesignup", ->
  #setting session cookie because of oAuth redirect
  $.cookie 'chef', false, { path: '/' }
  console.log("saved foodie cookie")
  if Simmr.scopes
    if Simmr.scopes.home
      console.log("In Home")
      console.log Simmr.scopes.home
      $.cookie 'after_sign_in_path_foodie', '/events', { path: '/' }
    if Simmr.scopes.event
      console.log("In Event")
      console.log Simmr.scopes.event.eventId
      console.log "event_path(#{Simmr.scopes.event.eventId})"
      $.cookie 'after_sign_in_path_foodie', "/events/#{Simmr.scopes.event.eventId}/?grabSeats", { path: '/' }
  else
    $.cookie 'after_sign_in_path_foodie', nil, { path: '/' }

$(document).on "click", ".bizsignup", ->
  #setting session cookie because of oAuth redirect
  $.cookie 'chef', true, { path: '/' }
  console.log("saved business cookie")
  if Simmr.scopes
    if Simmr.scopes.home
      console.log("In Home")
      console.log Simmr.scopes.home
      $.cookie 'after_sign_in_path_biz', "/edit_my_profile", { path: '/' }
    if Simmr.scopes.event
      console.log("In Event")
      console.log Simmr.scopes.event.eventId
      $.cookie 'after_sign_in_path_biz', "/events/#{Simmr.scopes.event.eventId}", { path: '/' }
  else
    $.cookie 'after_sign_in_path_biz', nil, { path: '/' }


$(document).on "click", ".usersignup.bizbutton", ->
  $("#new_user_biz").submit()

$(document).on "click", ".usersignup.foodiebutton", ->
  $("#new_user_foodie").submit()