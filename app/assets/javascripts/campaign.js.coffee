angular.module('Simmr').factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "campaign"
]

angular.module('Simmr').controller "CampaignCreateCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->

]

angular.module('Simmr').controller "CampaignEditCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Campaign) ->

]