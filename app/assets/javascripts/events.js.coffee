# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

states = Table: [
    stateabbrev: "AL"
    statename: "Alabama"
,
    stateabbrev: "AK"
    statename: "Alaska"
,
    stateabbrev: "AZ"
    statename: "Arizona"
,
    stateabbrev: "AR"
    statename: "Arkansas"
,
    stateabbrev: "CA"
    statename: "California"
,
    stateabbrev: "CO"
    statename: "Colorado"

    stateabbrev: "CT"
    statename: "Connecticut"
,
    stateabbrev: "DE"
    statename: "Delaware"
,
    stateabbrev: "DC"
    statename: "District of Columbia"
,
    stateabbrev: "FL"
    statename: "Florida"
,
    stateabbrev: "GA"
    statename: "Georgia"
,
    stateabbrev: "HI"
    statename: "Hawaii"
,
    stateabbrev: "ID"
    statename: "Idaho"
,
    stateabbrev: "IL"
    statename: "Illinois"
,
    stateabbrev: "IN"
    statename: "Indiana"
,
    stateabbrev: "IA"
    statename: "Iowa"
,
    stateabbrev: "KS"
    statename: "Kansas"
,
    stateabbrev: "KY"
    statename: "Kentucky"
,
    stateabbrev: "LA"
    statename: "Louisiana"
,
    stateabbrev: "ME"
    statename: "Maine"
,
    stateabbrev: "MD"
    statename: "Maryland"
,
    stateabbrev: "MA"
    statename: "Massachusetts"
,
    stateabbrev: "MI"
    statename: "Michigan"
,
    stateabbrev: "MN"
    statename: "Minnesota"
,
    stateabbrev: "MS"
    statename: "Mississippi"
,
    stateabbrev: "MO"
    statename: "Missouri"
,
    stateabbrev: "MT"
    statename: "Montana"
,
    stateabbrev: "NE"
    statename: "Nebraska"
,
    stateabbrev: "NV"
    statename: "Nevada"
,
    stateabbrev: "NH"
    statename: "New Hampshire"
,
    stateabbrev: "NJ"
    statename: "New Jersey"
,
    stateabbrev: "NM"
    statename: "New Mexico"
,
    stateabbrev: "NY"
    statename: "New York"
,
    stateabbrev: "NC"
    statename: "North Carolina"
,
    stateabbrev: "ND"
    statename: "North Dakota"
,
    stateabbrev: "OH"
    statename: "Ohio"
,
    stateabbrev: "OK"
    statename: "Oklahoma"
,
    stateabbrev: "OR"
    statename: "Oregon"
,
    stateabbrev: "PA"
    statename: "Pennsylvania"
,
    stateabbrev: "RI"
    statename: "Rhode Island"
,
    stateabbrev: "SC"
    statename: "South Carolina"
,
    stateabbrev: "SD"
    statename: "South Dakota"
,
    stateabbrev: "TN"
    statename: "Tennessee"
,
    stateabbrev: "TX"
    statename: "Texas"
,
    stateabbrev: "UT"
    statename: "Utah"
,
    stateabbrev: "VT"
    statename: "Vermont"
,
    stateabbrev: "VA"
    statename: "Virgina"
,
    stateabbrev: "WA"
    statename: "Washington"
,
    stateabbrev: "WV"
    statename: "West Virginia"
,
    stateabbrev: "WI"
    statename: "Wisconsin"
,
    stateabbrev: "WY"
    statename: "Wyoming"
]

stateNames = ""
j = 0

$(document).ready ->

  while j < states.Table.length
    stateNames += "<option value='" + states.Table[j].statename + "'>" + states.Table[j].stateabbrev + "</option>"
    j++

  $("#state").html stateNames

  $(".one-attendee").tooltip()

  $(".event-card-host-name").tooltip()

  $("#event-carousel").carousel interval: false

  $(".carousel-indicators li").click ->
    $(".carousel-indicators li").removeClass "active"
    $(this).addClass "active"

  $(".heart_this a").click ->
    if $(this).hasClass("black")
      $(this).removeClass "black"
      $(this).addClass "orange"
    else
      $(this).removeClass "orange"
      $(this).addClass "black"
