$(document).on "click", ".userlogin", ->
  $("#new_user_session").submit()

$(document).on "click", ".usersignup.bizbutton", ->
  $("#new_user_biz").submit()
  #$.post('/users', $('#new_user').serialize(),
  #	(data, status) ->
  #    if data.match('Uh-oh, there was')
  #      #render this data
  #    	#TODO: Probably want to make this better later...
  #      console.log('WAHHHHH!!')
  #    else
  #      window.location='/events'
  #)

$(document).on "click", ".usersignup.foodiebutton", ->
  $("#new_user_foodie").submit()

$(document).on "click", ".newpass", ->
  $("#new_pass").submit()

angular.module('Simmr').controller "UserRegisterCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]


$(document).on "click", ".foodiesignup", ->
  date = new Date()
  minutes = 5
  date.setTime date.getTime() + (minutes * 60 * 1000)
  #setting session cookie because of oAuth redirect
  $.cookie 'chef', false, { path: '/' }

$(document).on "click", ".bizsignup", ->
  date = new Date()
  minutes = 5
  date.setTime date.getTime() + (minutes * 60 * 1000)
  #setting session cookie because of oAuth redirect
  $.cookie 'chef', true, { path: '/' }