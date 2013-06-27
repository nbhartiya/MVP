# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  $(".campaign-card-lead-name").tooltip()

  $(".user-card-name").tooltip()

Simmr = angular.module('Simmr', ['uiSlider', 'ngResource', 'rails', 'ui', 'ui.bootstrap'])

Simmr.controller "ProfileEditCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]

Simmr.controller "SurveyCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

  $scope.currentQuestion = 0
  $scope.answers = []

  question =
    text: "fuck you do you like cats?"
    low_extreme: "dogs are cool"
    high_extreme: "cats are cool"
    low_image: "google.com/cat.jpg"
    high_image: "google.com/high.jpg"
  $scope.questions = []

  i = 0
  while i < 10
    q = angular.copy(question)
    q.text = " #{q.text} N #{i}"
    $scope.questions.push(q)
    $scope.answers.push({level: 0})
    i=i+1

  $scope.goNextCat = ->
    currentQuestion++

]