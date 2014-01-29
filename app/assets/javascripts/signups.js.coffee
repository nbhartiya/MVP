$(document).on 'click', '.signupbutton', (e) ->
  e.preventDefault()
  $.cookie 'submitted_email', true, { path: '/' }
  $('#new_signup').submit()