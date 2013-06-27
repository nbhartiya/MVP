Simmr = angular.module('Simmr', ['uiSlider', 'ngResource', 'rails', 'ui', 'ui.bootstrap'])

Simmr.factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "campaign"
]

Simmr.controller "CampaignCreateCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Event) ->

]

Simmr.controller "CampaignEditCtrl", ["$scope",  "$routeParams", "$location", "Campaign", ($scope, $routeParams, $location, Event) ->

]