angular.module('Simmr').factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "campaign"
]

angular.module('Simmr').controller "CampaignCreateCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->
  $scope.imageUrls = []

  $scope.uploadImages = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: true
    ,
      location: "S3"
      path: '/simmreventimages/'
    , (InkBlobs) ->
      console.log JSON.stringify(InkBlobs)

      i=0
      while i< Object.keys(InkBlobs).length
        $scope.image="https://s3.amazonaws.com/#{InkBlobs[i].key}"
        console.log $scope.image
        $scope.imageUrls.push($scope.image)
        filepicker.read InkBlobs[i].url,
          base64encode: true
        , (imgdata) ->
          $('.events .carousel-inner').append("<div class = 'item'><img src = 'data:image/png;base64,#{imgdata}'></div>")
        i++

]

angular.module('Simmr').controller "CampaignEditCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->

  $scope.imageUrls = []

  $scope.uploadImages = ->
    filepicker.pickAndStore
      mimetypes: ["image/*", "text/plain"]
      services: ["COMPUTER", "FACEBOOK", "GMAIL", "INSTAGRAM"]
      multiple: true
    ,
      location: "S3"
      path: '/simmreventimages/'
    , (InkBlobs) ->
      console.log JSON.stringify(InkBlobs)

      i=0
      while i< Object.keys(InkBlobs).length
        $scope.image="https://s3.amazonaws.com/#{InkBlobs[i].key}"
        console.log $scope.image
        $scope.imageUrls.push($scope.image)
        filepicker.read InkBlobs[i].url,
          base64encode: true
        , (imgdata) ->
          $('.events .carousel-inner').append("<div class = 'item'><img src = 'data:image/png;base64,#{imgdata}'></div>")
        i++

]

$(".campaigns .heart_this a").click ->
  if $(this).hasClass("gray")
    $(this).removeClass "gray"
    $(this).addClass "orange"
  else
    $(this).removeClass "orange"
    $(this).addClass "gray"