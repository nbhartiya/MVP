$ ->
  # $("#credit-card input, #credit-card select").attr "disabled", false
  ($ "input[type='submit']").click ->
    # $("#user_submit").attr "disabled", true
    # $("#credit-card input, #credit-card select").attr "name", ""
    # $("#credit-card-errors").hide()
    # unless $("#credit-card").is(":visible")
    #   $("#credit-card input, #credit-card select").attr "disabled", true
    #   return true
    card =
      number: $("#credit_card_number").val()
      expMonth: $("#expiration_month").val()
      expYear: $("#expiration_year").val()
      cvc: $("#security_code").val()

    Stripe.createToken card, (status, response) ->
      if status is 200
        $("#charge_last4").val response.card.last4
        $("#charge_token").val response.id
        $("#new_charge").submit()
        alert '200'
        console.log response
      else
        #$("#stripe-error-message").text response.error.message
        #$("#credit-card-errors").show()
        #$("#user_submit").attr "disabled", false
        alert 'not 200'

    false

  #$("#change-card a").click ->
  #  $("#change-card").hide()
  #  $("#credit-card").show()
  #  $("#credit_card_number").focus()
  #  false

