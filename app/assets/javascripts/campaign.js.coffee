Simmr = angular.module('Simmr', ['uiSlider', 'ngResource', 'rails', 'ui', 'ui.bootstrap'])

Simmr.factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "campaign"
]