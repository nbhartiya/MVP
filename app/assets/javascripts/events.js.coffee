# states and neighborhood jsons

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

neighborhoodsSF = [
    name: "Alamo Square"
,
    name: "Anza Vista"
,
    name: "Ashbury Heights"
,
    name: "Balboa Terrace"
,
    name: "Bayview-Hunters Point"
,
    name: "Bernal Heights"
,
    name: "Castro"
,
    name: "Chinatown"
,
    name: "Civic Center"
,
    name: "Cole Valley"
,
    name: "Corona Heights"
,
    name: "Crocker-Amazon"
,
    name: "Diamond Heights"
,
    name: "Dogpatch"
,
    name: "Duboce Triangle"
,
    name: "Embarcadero"
,
    name: "Excelsior"
,
    name: "Fillmore"
,
    name: "Financial District"
,
    name: "Fisherman's Wharf"
,
    name: "Forest Hill"
,
    name: "Glen Park"
,
    name: "Hayes Valley"
,
    name: "Ingleside"
,
    name: "Ingleside Heights"
,
    name: "Ingleside Terraces"
,
    name: "Inner Richmond"
,
    name: "Inner Sunset"
,
    name: "Japantown"
,
    name: "Lakeshore"
,
    name: "Lakeside"
,
    name: "Laurel Heights"
,
    name: "Lower Haight"
,
    name: "Lower Pacific Heights"
,
    name: "Marina/Cow Hollow"
,
    name: "Merced Heights"
,
    name: "Merced Manor"
,
    name: "Miraloma Park"
,
    name: "Mission"
,
    name: "Mission Bay"
,
    name: "Mission Terrace"
,
    name: "Monterey Heights"
,
    name: "Mount Davidson Manor"
,
    name: "NoPa"
,
    name: "Nob Hill"
,
    name: "Noe Valley"
,
    name: "North Beach/Telegraph Hill"
,
    name: "Oceanview"
,
    name: "Outer Mission"
,
    name: "Outer Richmond"
,
    name: "Outer Sunset"
,
    name: "Pacific Heights"
,
    name: "Parkmerced"
,
    name: "Parkside"
,
    name: "Portola"
,
    name: "Potrero Hill"
,
    name: "Presidio"
,
    name: "Presidio Heights"
,
    name: "Russian Hill"
,
    name: "Sausalito"
,
    name: "Sea Cliff"
,
    name: "Sherwood Forest"
,
    name: "SoMa"
,
    name: "St. Francis Wood"
,
    name: "Stonestown"
,
    name: "Sunnyside"
,
    name: "Tenderloin"
,
    name: "The Haight"
,
    name: "Twin Peaks"
,
    name: "Union Square"
,
    name: "Visitacion Valley"
,
    name: "West Portal"
,
    name: "Western Addition"
,
    name: "Westwood Highlands"
,
    name: "Westwood Park"
]

neighborhoodNames = ""
k = 0

while k < neighborhoodsSF.length
  neighborhoodNames += "<option value='" + neighborhoodsSF[k].name + "'>" + neighborhoodsSF[k].name + "</option>"
  k++

$("#neighborhoods").html neighborhoodNames

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
