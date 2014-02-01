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

facebookConversionPixel = (fb_pixel, fb_value) ->
  image = new Image(1, 1)
  image.src = "https://www.facebook.com/offsite_event.php?id=" + fb_pixel + "&amp;value=" + fb_value + "&amp;currency=USD"

$(document).on "click", ".foodiesignup", ->
  #setting session cookie because of oAuth redirect
  $.cookie 'chef', false, { path: '/' }
  console.log("saved foodie cookie")
  if Simmr.scopes
    if Simmr.scopes.home
      $.cookie 'after_sign_in_path_foodie', '/events', { path: '/' }
    if Simmr.scopes.event
      console.log("In Event")
      console.log Simmr.scopes.event.eventId
      console.log "event_path(#{Simmr.scopes.event.eventId})"
      if Simmr.scopes.event.showSeats
        $.cookie 'after_sign_in_path_foodie', "/events/#{Simmr.scopes.event.eventId}/?grabSeats", { path: '/' }
      if Simmr.scopes.event.waitlist
        $.cookie 'after_sign_in_path_foodie', "/events/#{Simmr.scopes.event.eventId}/?waitList", { path: '/' }
    if Simmr.scopes.post_event
      console.log("In Post-Event")
      console.log Simmr.scopes.post_event.eventId
      if Simmr.scopes.post_event.waitlist
        $.cookie 'after_sign_in_path_foodie',"/events/#{Simmr.scopes.post_event.eventId}/post_event/?waitList", { path: '/'}
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
  facebookConversionPixel(6013741359832,0.01)
  $("#new_user_foodie").submit()
  