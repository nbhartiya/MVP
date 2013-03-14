# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".sign_up_form").validate
    rules:
      first_name: "required"
      last_name: "required"
      email:
        required: true
        email: true

      password:
        required: true
        minlength: 6

      password_confirmation:
        required: true
        equalTo: "[name=password]"

    messages:
      first_name: "Hey, you didn't enter your first name!"
      last_name: "You're not Madonna or Cher, so enter something."
      email:
        required: "What's your email?!?!?!"
        email: "That's not an email, that's my wife!!!!!!!"

      password:
        required: "Enter your secret code."
        minlength: "You must have a death wish"

      password_confirmation:
        required: "Enter your secret code, redux."
        equalTo: "Redux means again in this case"

    errorLabelContainer: ".error_container"
    errorElement: "div"
    invalidHandler: ->
      alert "you have made mistakes, please check yourself."

    submitHandler: (form) ->
      $.ajax
        url: $(form).attr("action")
        data: $(form).serialize()
        success: ->
          $(".dialog").dialog "close"

      false

  $(".sign_up").click ->
    $(".dialog").dialog
      modal: true
      buttons:
        Cancel: ->
          $(this).dialog "close"

        "Sign Up": ->
          $(this).find(".sign_up_form").submit()

    false