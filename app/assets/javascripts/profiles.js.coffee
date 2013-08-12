angular.module('Simmr').factory "Profile", ["railsResourceFactory", (railsResourceFactory) -> 
  railsResourceFactory
    url: "api/profiles"
    name: "profile"
]

$(".campaign-card-lead-name").tooltip()

$("#profile-images-button").mouseenter ->
  $("td.profile-photo").addClass('highlight')

$("#profile-images-button").mouseleave ->
  $("td.profile-photo").removeClass('highlight')

$(".user-card-name").tooltip()

$("#why-yelp").tooltip()

$("#profile-carousel").carousel interval: false

$(".answer-image").click ->
  $(this).toggleClass "highlight"
  if $(this).hasClass "highlight"
    console.log($(this))

$(".heart").click ->
  $(this).toggleClass("black").toggleClass("orange")  if $(this).hasClass("profile-follow")


angular.module('Simmr').controller "ProfileEditCtrl", ["$scope",  "$routeParams", "$location", "Profile", ($scope, $routeParams, $location, Profile) ->
  $scope.edit = 1

  $scope.getProfile = (profileId) ->
    console.log Profile
    Profile.get(id: profileId).then (result) ->
      $scope.profile = result

  $scope.imageUrls = []
  $scope.avatar = []

  $scope.uploadImages = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: true
    ,
      location: "S3"
      access: "public"
    , (InkBlobs) ->
      console.log JSON.stringify(InkBlobs)

      $('.default').remove()
      $('.carousel-inner').empty()
      $scope.eventImageUrls = []

      i=0
      while i< Object.keys(InkBlobs).length
        $scope.image="#{InkBlobs[i].url}"
        console.log $scope.image
        $scope.campaignImageUrls.push($scope.image)
        if i == 0
          $('.campaigns .carousel-inner').append("<div class = 'item active'><img src = #{$scope.campaignImageUrls[i]}></div>")
        else 
          $('.campaigns .carousel-inner').append("<div class = 'item'><img src = #{$scope.campaignImageUrls[i]}></div>")
        i++
      $('#remove-image').css('display', 'inherit')
      if Object.keys(InkBlobs).length>1
        $('.campaign-profile').append("<a class = 'carousel-control left hidden-phone' data-slide = 'prev' href = '#campaign-carousel'> ‹ </a><a class = 'carousel-control right hidden-phone' data-slide = 'next' href = '#campaign-carousel'> › </a>")


  $scope.uploadImages = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: true
    ,
      location: "S3"
      access: "public"
    , (InkBlobs) ->
      console.log JSON.stringify(InkBlobs)

      $('.default').remove()
      $('.carousel-inner').empty()
      $scope.imageUrls = []

      i=0
      while i< Object.keys(InkBlobs).length
        $scope.image="#{InkBlobs[i].url}"
        console.log $scope.image
        $scope.imageUrls.push($scope.image)

        if i == 0
          $('.profiles .carousel-inner').append("<div class = 'item active'><img src = #{$scope.imageUrls[i]}></div>")
        else
          $('.profiles .carousel-inner').append("<div class = 'item'><img src = #{$scope.imageUrls[i]}></div>")
        i++
      $('#remove-image').css('display', 'inherit')
      if Object.keys(InkBlobs).length>1
        $('.carousel-inner').append("<a class = 'carousel-control left hidden-phone' data-slide = 'prev' href = '#profile-carousel'> < </a><a class = 'carousel-control right hidden-phone' data-slide = 'next' href = '#profile-carousel'> > </a>")
  
  $scope.uploadProfileImage = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: false
    ,
      location: "S3"
      access: "public"
    , (InkBlob) ->
      console.log JSON.stringify(InkBlob)

      $scope.image="#{InkBlob[0].url}"
      console.log $scope.image
      $scope.avatar.push($scope.image)
      $('td.profile-photo').empty()
      $('td.profile-photo').append("<img src = '#{$scope.avatar}'></div>")

  $scope.removeImages = ->
    currentImage = $(".active img").attr('src')
    $('.item').remove(":contains('#{currentImage}')")
    $('.carousel-inner div:first-child').append('.active')
    i = 0
    while i < $scope.imageUrls.length
      if currentImage == $scope.imageUrls[i]
        $scope.imageUrls.splice(i, 1)
      i++
    if $scope.imageUrls.length <= 1
      $('.carousel-control').remove()
]



angular.module('Simmr').controller "ProfileShowCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

  $scope.mapUrl = ->
    mapUrl = "http://maps.google.com/?q=#{$scope.address1},#{$scope.city}, #{$scope.state},#{$scope.zipcode}"
]

angular.module('Simmr').controller "SurveyCtrl", ["$scope",  "$routeParams", "$location", "Profile", "$window", ($scope, $routeParams, $location, Profile, $window) ->

  $scope.currentQuestion = 0
  $scope.answers = []
  $scope.chef = $.cookie('chef')

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
  
  $scope.coverImageUrl = []
  $scope.avatar = []

  $scope.uploadImages = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: false
    ,
      location: "S3"
      access: "public"
    , (InkBlob) ->
      console.log JSON.stringify(InkBlob)

      $scope.image="#{InkBlob[0].url}"
      console.log $scope.image
      $scope.coverImageUrl.push($scope.image)
      $('.cover-image-row .default').remove()
      $('.cover-image-row').empty()
      filepicker.read InkBlob[0].url, base64encode: true, (imgdata) ->
        $('.cover-image-row').append("<div class = 'cover-image span3'><img src = 'data:image/*;base64,#{imgdata}'></div>")
  
  $scope.uploadProfileImage = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: false
    ,
      location: "S3"
      access: "public"
    , (InkBlob) ->
      console.log JSON.stringify(InkBlob)

      $scope.image="https://s3-us-west-1.amazonaws.com/simmrimages/#{InkBlob[0].key}"
      console.log $scope.image
      $scope.avatar.push($scope.image)
      $('.profile-image-row .default').remove()
      $('.profile-image-row').empty()
      filepicker.read InkBlob[0].url, base64encode: true, (imgdata) ->
        $('.profile-image-row').append("<div class = 'profile-image span3'><img src = 'data:image/*;base64,#{imgdata}'></div>")
  
  $scope.selectAns = (selection) ->
    $scope.user_answers ||= []
    console.log(selection)
    $scope.user_answers.push(selection)

  $scope.createProfile = (profile) ->
    console.log($scope.coverImageUrl, $scope.avatar)
    if $scope.coverImageUrl?
      profile.coverImageUrl = $scope.coverImageUrl[0]
    if $scope.avatar?
      profile.avatar = $scope.avatar[0]
    alert('inside!')
    console.log(profile)
    new Profile(profile).create().then (data) =>
      console.log data, "~~~~~~~~~~"
      $scope.created = true
    $window.location.href='/events'
  
]