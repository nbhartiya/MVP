Simmr = angular.module('Simmr', ['ngResource', 'rails', 'ui', 'ui.bootstrap'])
Simmr.factory "Charge", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/charges"
    name: "charge"
]

Simmr.factory "Campaign", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/campaigns"
    name: "camapign"
]

Simmr.controller "EventRegisterCtrl", ["$scope",  "$routeParams", "$location", "Charge", ($scope, $routeParams, $location, Charge) ->
  $scope.guests = []

  $scope.guest = {}
  $scope.guest.name = ''
  $scope.guest.email = ''
  $scope.buyer = {}
  $scope.buyer.name = ''
  $scope.buyer.ccNumber = ''
  $scope.buyer.ccSecCode = ''
  $scope.buyer.ccExpMonth = ''
  $scope.buyer.ccExpYear = ''
  $scope.buyer.billingAddress = ''
  $scope.buyer.billingCity = ''
  $scope.buyer.billingState = ''
  $scope.buyer.billingZip = ''
  
  $scope.total = ->
    $scope.num_guests * parseInt($scope.cost)

  $scope.showPayment = ->
    $scope.guests = []
    if $scope.num_guests > 0
      $scope.currentUser.name = $scope.currentUser.first_name + ' ' + $scope.currentUser.last_name
      $scope.guests.push($scope.currentUser)
      i = 0
      while i <  $scope.num_guests - 1
        $scope.guests.push({})
        i++
      $scope.payment = 1
    else
      alert 'Please select number of seats!'
    # TODO: Make this error message appear inline somewhere instead of as an alert

  $scope.gotoPayment = ->
    error = 0
    angular.forEach($scope.guests, (guest) =>
      if guest.name == "" or guest.email == ""
        error = 1
      if typeof guest.name is 'undefined' or typeof guest.email is 'undefined'
        error = 1
    )
    if error == 0
      $scope.payment = 2 
    else
      alert "Please enter the name and email addresses of all of the guests."
    # TODO: Make this error message appear inline somewhere instead of as an alert

  $scope.submitPayment = ->
    if $scope.buyer.name == ''
    	$scope.buyer.nameError = true
    else
    	$scope.buyer.nameError = false

    if $scope.buyer.ccNumber == ''
    	$scope.buyer.ccNumberError = true
    else
    	$scope.buyer.ccNumberError = false

    if $scope.buyer.ccSecCode == ''
    	$scope.buyer.ccSecCodeError = true
    else
    	$scope.buyer.ccSecCodeError = false

    if $scope.buyer.ccExpMonth == ''
    	$scope.buyer.ccExpMonthError = true
    else
    	$scope.buyer.ccExpMonthError = false

    if $scope.buyer.ccExpYear == ''
    	$scope.buyer.ccExpYearError = true
    else
    	$scope.buyer.ccExpYearError = false

    if $scope.buyer.billingAddress == ''
    	$scope.buyer.billingAddressError = true
    else
    	$scope.buyer.billingAddressError = false

    if $scope.buyer.billingCity == ''
    	$scope.buyer.billingCityError = true
    else
    	$scope.buyer.billingCityError = false

    if $scope.buyer.billingState == ''
    	$scope.buyer.billingStateError = true
    else
    	$scope.buyer.billingStateError = false

    if $scope.buyer.billingZip == ''
    	$scope.buyer.billingZipError = true
    else
    	$scope.buyer.billingZipError = false
    
    $scope.submitCard($scope.card)
  $scope.card =
    number: "4242424242424242"
    expMonth: '12'
    expYear: '2015'
    cvc: '123'
  $scope.data = {}
  $scope.submitCard = (card) ->
    Stripe.createToken card, (status, response) ->
      if status is 200
        console.log response
        $scope.data.last4 = response.card.last4
        $scope.data.token = response.id
        $scope.data.guests = $scope.guests
        $scope.data.buyer = $scope.buyer
        new Charge($scope.data).create().then (data) =>
          console.log data, "~~~~~~~~~~"
          if data.status == "Success"
            $scope.payment = 3
      else
        console.log response
]

Simmr.controller "EventCreateCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]

Simmr.controller "EventFeedbackCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]

Simmr.controller "ProfileEditCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

]