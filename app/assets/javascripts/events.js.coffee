$(".heart").click ->
  $(this).toggleClass "orange"

# states and neighborhood and time jsons

states = Table: [
    stateabbrev: "State"
    statename: ""
,
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
,
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

while j < states.Table.length
  stateNames += "<option value='" + states.Table[j].statename + "'>" + states.Table[j].stateabbrev + "</option>"
  j++

$("#state").html stateNames

neighborhoodsSF = Table: [
    name: "Neighborhood"
    value: ""
,
    name: "Alamo Square"
    value: "Alamo Square"
,
    name: "Anza Vista"
    value: "Anza Vista"
,
    name: "Ashbury Heights"
    value: "Ashbury Heights"
,
    name: "Balboa Terrace"
    value: "Balboa Terrace"
,
    name: "Bayview-Hunters Point"
    value: "Bayview-Hunters Point"
,
    name: "Bernal Heights"
    value: "Bernal Heights"
,
    name: "Castro"
    value: "Castro"
,
    name: "Chinatown"
    value: "Chinatown"
,
    name: "Civic Center"
    value: "Civic Center"
,
    name: "Cole Valley"
    value: "Cole Valley"
,
    name: "Corona Heights"
    value: "Corona Heights"
,
    name: "Crocker-Amazon"
    value: "Crocker-Amazon"
,
    name: "Diamond Heights"
    value: "Diamond Heights"
,
    name: "Dogpatch"
    value: "Dogpatch"
,
    name: "Duboce Triangle"
    value: "Duboce Triangle"
,
    name: "Embarcadero"
    value: "Embarcadero"
,
    name: "Excelsior"
    value: "Excelsior"
,
    name: "Fillmore"
    value: "Fillmore"
,
    name: "Financial District"
    value: "Financial District"
,
    name: "Fisherman's Wharf"
    value: "Fisherman's Wharf"
,
    name: "Forest Hill"
    value: "Forest Hill"
,
    name: "Glen Park"
    value: "Glen Park"
,
    name: "Hayes Valley"
    value: "Hayes Valley"
,
    name: "Ingleside"
    value: "Ingleside"
,
    name: "Ingleside Heights"
    value: "Ingleside Heights"
,
    name: "Ingleside Terraces"
    value: "Ingleside Terraces"
,
    name: "Inner Richmond"
    value: "Inner Richmond"
,
    name: "Inner Sunset"
    value: "Inner Sunset"
,
    name: "Japantown"
    value: "Japantown"
,
    name: "Lakeshore"
    value: "Lakeshore"
,
    name: "Lakeside"
    value: "Lakeside"
,
    name: "Laurel Heights"
    value: "Laurel Heights"
,
    name: "Lower Haight"
    value: "Lower Haight"
,
    name: "Lower Pacific Heights"
    value: "Lower Pacific Heights"
,
    name: "Marina/Cow Hollow"
    value: "Marina/Cow Hollow"
,
    name: "Merced Heights"
    value: "Merced Heights"
,
    name: "Merced Manor"
    value: "Merced Manor"
,
    name: "Miraloma Park"
    value: "Miraloma Park"
,
    name: "Mission"
    value: "Mission"
,
    name: "Mission Bay"
    value: "Mission Bay"
,
    name: "Mission Terrace"
    value: "Mission Terrace"
,
    name: "Monterey Heights"
    value: "Monterey Heights"
,
    name: "Mount Davidson Manor"
    value: "Mount Davidson Manor"
,
    name: "NoPa"
    value: "NoPa"
,
    name: "Nob Hill"
    value: "Nob Hill"
,
    name: "Noe Valley"
    value: "Noe Valley"
,
    name: "North Beach/Telegraph Hill"
    value: "North Beach/Telegraph Hill"
,
    name: "Oceanview"
    value: "Oceanview"
,
    name: "Outer Mission"
    value: "Outer Mission"
,
    name: "Outer Richmond"
    value: "Outer Richmond"
,
    name: "Outer Sunset"
    value: "Outer Sunset"
,
    name: "Pacific Heights"
    value: "Pacific Heights"
,
    name: "Parkmerced"
    value: "Parkmerced"
,
    name: "Parkside"
    value: "Parkside"
,
    name: "Portola"
    value: "Portola"
,
    name: "Potrero Hill"
    value: "Potrero Hill"
,
    name: "Presidio"
    value: "Presidio"
,
    name: "Presidio Heights"
    value: "Presidio Heights"
,
    name: "Russian Hill"
    value: "Russian Hill"
,
    name: "Sausalito"
    value: "Sausalito"
,
    name: "Sea Cliff"
    value: "Sea Cliff"
,
    name: "Sherwood Forest"
    value: "Sherwood Forest"
,
    name: "SoMa"
    value: "SoMa"
,
    name: "St. Francis Wood"
    value: "St. Francis Wood"
,
    name: "Stonestown"
    value: "Stonestown"
,
    name: "Sunnyside"
    value: "Sunnyside"
,
    name: "Tenderloin"
    value: "Tenderloin"
,
    name: "The Haight"
    value: "The Haight"
,
    name: "Twin Peaks"
    value: "Twin Peaks"
,
    name: "Union Square"
    value: "Union Square"
,
    name: "Visitacion Valley"
    value: "Visitacion Valley"
,
    name: "West Portal"
    value: "West Portal"
,
    name: "Western Addition"
    value: "Western Addition"
,
    name: "Westwood Highlands"
    value: "Westwood Highlands"
,
    name: "Westwood Park"
    value: "Westwood Park"
, 
    name: "Other"
    value: "Other"
]

neighborhoodNames = ""
k = 0

while k < neighborhoodsSF.Table.length
  neighborhoodNames += "<option value='" + neighborhoodsSF.Table[k].value + "'>" + neighborhoodsSF.Table[k].name + "</option>"
  k++

$("#neighborhoods").html neighborhoodNames

times = Table: [
    name: "Time"
    value: ""
,
    name: "12:00 AM"
    value: "2000-01-01 00:00:00"
,
    name: "12:30 AM"
    value: "2000-01-01 00:30:00"
,
    name: "7:00 AM"
    value: "2000-01-01 7:00:00"
,
    name: "7:30 AM"
    value: "2000-01-01 7:30:00"
,
    name: "8:00 AM"
    value: "2000-01-01 8:00:00"
,
    name: "8:30 AM"
    value: "2000-01-01 8:30:00"
,
    name: "9:00 AM"
    value: "2000-01-01 9:00:00"
,
    name: "9:30 AM"
    value: "2000-01-01 9:30:00"
,
    name: "10:00 AM"
    value: "2000-01-01 10:00:00"
,
    name: "10:30 AM"
    value: "2000-01-01 10:30:00"
,
    name: "11:00 AM"
    value: "2000-01-01 11:00:00"
,
    name: "11:30 AM"
    value: "2000-01-01 11:30:00"
,
    name: "12:00 PM"
    value: "2000-01-01 12:00:00"
,
    name: "12:30 PM"
    value: "2000-01-01 12:30:00"
,
    name: "1:00 PM"
    value: "2000-01-01 13:00:00"
,
    name: "1:30 PM"
    value: "2000-01-01 13:30:00"
,
    name: "2:00 PM"
    value: "2000-01-01 14:00:00"
,
    name: "2:30 PM"
    value: "2000-01-01 14:30:00"
,
    name: "3:00 PM"
    value: "2000-01-01 15:00:00"
,
    name: "3:30 PM"
    value: "2000-01-01 15:30:00"
,
    name: "4:00 PM"
    value: "2000-01-01 16:00:00"
,
    name: "4:30 PM"
    value: "2000-01-01 16:30:00"
,
    name: "5:00 PM"
    value: "2000-01-01 17:00:00"
,
    name: "5:30 PM"
    value: "2000-01-01 17:30:00"
,
    name: "6:00 PM"
    value: "2000-01-01 18:00:00"
,
    name: "6:30 PM"
    value: "2000-01-01 18:30:00"
,
    name: "7:00 PM"
    value: "2000-01-01 19:00:00"
,
    name: "7:30 PM"
    value: "2000-01-01 19:30:00"
,
    name: "8:00 PM"
    value: "2000-01-01 20:00:00"
,
    name: "8:30 PM"
    value: "2000-01-01 20:30:00"
,
    name: "9:00 PM"
    value: "2000-01-01 21:00:00"
,
    name: "9:30 PM"
    value: "2000-01-01 21:30:00"
,
    name: "10:00 PM"
    value: "2000-01-01 22:00:00"
,
    name: "10:30 PM"
    value: "2000-01-01 22:30:00"
,
    name: "11:00 PM"
    value: "2000-01-01 23:00:00"
,
    name: "11:30 PM"
    value: "2000-01-01 23:30:00"
]

timeOptions = ""
l = 0

while l < times.Table.length
  timeOptions += "<option value='" + times.Table[l].value + "'>" + times.Table[l].name + "</option>"
  l++

$("#times").html timeOptions

$(".one-attendee").tooltip()

$(".cvc-explanation").tooltip()

$(".event-card-host-name").tooltip()

$("#event-carousel").carousel interval: false

$("#remove-image").click ->
  $(".active.item").remove()
  $(".item:first-child").addClass "active"

$(document).on 'click', '.points', (e) ->
  e.preventDefault()

img = '<img src="/assets/CVC.jpeg" />';

$(".cvc-explanation").popover
  title: "What is CVC?"
  content: img
  html: true
