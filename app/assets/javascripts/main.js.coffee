angular.module('Simmr').factory "Event", ["railsResourceFactory", (railsResourceFactory) -> railsResourceFactory
    url: "/api/events"
    name: "event"
]

angular.module('Simmr').factory "Charge", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/charges"
    name: "charge"
]

angular.module('Simmr').factory "Location", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/api/locations"
    name: "location"
]

angular.module('Simmr').controller "EventRegisterCtrl", ["$scope",  "$routeParams", "$location", "Charge", "Event", ($scope, $routeParams, $location, Charge, Event) ->
  $scope.guests = []

  $scope.guest = {}
  $scope.guest.name = ''
  $scope.guest.email = ''
  $scope.buyer = {}
  $scope.buyer.name = ''
  
  $scope.total = ->
    total = $scope.num_guests * $scope.cost
    total = total.toFixed(2)

  $scope.showPayment = ->
    $scope.guests = []
    $scope.guests_left = $scope.num_guests
    $scope.guest_pages = 0
    if $scope.num_guests > 0
      $scope.currentUser.name = $scope.currentUser.first_name + ' ' + $scope.currentUser.last_name
      $scope.guests.push($scope.currentUser)
      i = 0
      if $scope.num_guests % 3 == 0 
        $scope.guest_pages = $scope.num_guests / 3
      else
        $scope.guest_pages = $scope.num_guests / 3 + 1
      
#      j=0
#      while j<$scope.guest_pages
      while i < $scope.guests_left - 1 and i < 2
        $scope.guests.push({})
        i++
#        $scope.guests_left -= 3
#        i=0

      $scope.payment = 1

  $scope.gotoPayment = ->
    error = 0
    angular.forEach($scope.guests, (guest) =>
      if typeof guest.name is 'undefined'
        error = 1
        guest.nameError = true
      if typeof guest.email is 'undefined'
        error = 2
        guest.emailError = true
      if typeof guest.name is 'undefined' and typeof guest.email is 'undefined'
        error = 3
        guest.nameError = true
        guest.emailError = true
    )
    if error == 0
      $scope.payment = 2 
    if error == 1
      $('.error.name').show()
    if error == 2
      $('.error.email').show()
    if error == 3
      $('.error.both').show()

  $scope.submitPayment = ->    
    $scope.submitCard($scope.card)
  
  $scope.card =
    number: ""
    expMonth: ''
    expYear: ''
    cvc: ''
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

angular.module('Simmr').controller "EventCreateCtrl", ["$scope",  "$routeParams", "$location", "Event", "Location", ($scope, $routeParams, $location, Event, Location) ->

  $scope.createEvent = (event, space) ->
    new Event(event).create().then (data) =>
      console.log data, "~~~~~~~~~~"

]

angular.module('Simmr').controller "EventEditCtrl", ["$scope",  "$routeParams", "$location", "Event", ($scope, $routeParams, $location, Event) ->

]

angular.module('Simmr').controller "EventFeedbackCtrl", ["$scope",  "$routeParams", "$location", ($scope, $routeParams, $location) ->

  $scope.feedback=1

]