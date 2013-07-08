$(".campaign-card-lead-name").tooltip()

$(".user-card-name").tooltip()

$("#why-yelp").tooltip()

$(".answer-image img").click ->
  $(this).toggleClass "highlight"

$(".profiles .heart_this a").click ->
  if $(this).hasClass("gray")
    $(this).removeClass "gray"
    $(this).addClass "orange"
  else
    $(this).removeClass "orange"
    $(this).addClass "gray"


angular.module('Simmr').controller "ProfileEditCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]

angular.module('Simmr').controller "SurveyCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

  $scope.currentQuestion = 0
  $scope.answers = []

  question = [
    text: "What type of event would you be most excited about?"
    low_extreme: "low extreme 1"
    high_extreme: "high extreme 1"
    low_image: "Food 17.jpg"
    high_image: "Food 17.jpg"
  ,
    text: "What type of event would you be most excited about?"
    low_extreme: "low extreme 2"
    high_extreme: "high extreme 2"
    low_image: "Food 17.jpg"
    high_image: "Food 17.jpg"
  ,
    text: "What type of event would you be most excited about?"
    low_extreme: "low extreme 3"
    high_extreme: "high extreme 3"
    low_image: "Food 17.jpg"
    high_image: "Food 17.jpg"
  ,
    text: "What type of event would you be most excited about?"
    low_extreme: "low extreme 4"
    high_extreme: "high extreme 4"
    low_image: "Food 17.jpg"
    high_image: "Food 17.jpg"
  ,
    text: "Which of the below are your favorite restaurants?"
    answers: [
      answer: "restaurant1"
      image: "Food 17.jpg"
    ,
      answer: "restuarant2"
      image: "Food 17.jpg"
    ,
      answer: "restaurant3"
      image: "Food 17.jpg"
    ,
      answer: "restaurant4"
      image: "Food 17.jpg"
    ,
      answer: "retaurant5"
      image: "Food 17.jpg"
    ,
      answer: "restaurant6"
      image: "Food 17.jpg"
    ] 
  ,
    text: "Which of the below are your favorite cuisines?"
    answers: [
      answer: "cuisine1"
      image: "Food 17.jpg"
    ,
      answer: "cuisine2"
      image: "Food 17.jpg"
    ,
      answer: "cuisine3"
      image: "Food 17.jpg"
    ,
      answer: "cuisine4"
      image: "Food 17.jpg"
    ,
      answer: "cuisine5"
      image: "Food 17.jpg"
    ,
      answer: "cuisine6"
      image: "Food 17.jpg"
    ]
  ,
    text: "Which of these types of events are you interested in?"
    answers: [
      answer: "savory food-focused"
      image: "Food 17.jpg"
    ,
      answer: "sweets-focused"
      image: "Food 17.jpg"
    ,
      answer: "alcohol-focused"
      image: "Food 17.jpg"
    ,
      answer: "non-alcoholic drink-focused (e.g. coffee, tea)"
      image: "Food 17.jpg"
    ,
      answer: "other1"
      image: "Food 17.jpg"
    ,
      answer: "other2"
      image: "Food 17.jpg"
    ]
  ]

  $scope.questions = []
  $scope.beginning = true
  $scope.end = false

  i = 0
  while i < question.length
    q = angular.copy(question[i])
    q.text = " #{q.text}"
    $scope.questions.push(q)
    if i<4
      $scope.answers.push({level: 0})
    i++

  $scope.progress = 1 / ($scope.questions.length + 1) * 100

  $scope.nextQuestion = ->
    if $scope.currentQuestion < $scope.questions.length - 1
      $scope.currentQuestion = $scope.currentQuestion + 1
    if $scope.currentQuestion == $scope.questions.length-1
      $scope.end = true
    else
      $scope.end = false
    if $scope.currentQuestion == 0
      $scope.beginning = true
    else
      $scope.beginning = false
    $scope.progress = ($scope.currentQuestion + 1) / ($scope.questions.length + 1) * 100

  $scope.prevQuestion = ->
    if $scope.currentQuestion > 0
      $scope.currentQuestion = $scope.currentQuestion - 1
    if $scope.currentQuestion == $scope.questions.length-1
      $scope.end = true
    else
      $scope.end = false
    if $scope.currentQuestion == 0
      $scope.beginning = true
    else
      $scope.beginning = false
    $scope.progress = ($scope.currentQuestion + 1) / ($scope.questions.length + 1) * 100

  
]