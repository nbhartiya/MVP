angular.module('Simmr').factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "campaign"
]

angular.module('Simmr').controller "CampaignCreateCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->

]

angular.module('Simmr').controller "CampaignEditCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->

]

$(".campaigns .heart_this a").click ->
  if $(this).hasClass("gray")
    $(this).removeClass "gray"
    $(this).addClass "orange"
  else
    $(this).removeClass "orange"
    $(this).addClass "gray"