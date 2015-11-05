$(document).ready ->
  console.debug "wired up"
  $("form#new_contest").on "submit", (e) ->
    e.preventDefault()
    $.post "/contests", $(e.target).serialize()
      .done (data) ->
        console.debug data
        $('.success-hide').html "<h4 class='success-message'>Thank you for entering our sweepstakes. Good Luck!</h4>"
        # $('.success-hide').css "display", "none"

      .fail (data) ->
        $.each $.parseJSON(data['responseText'])['errors'], (key, message) ->
          el = $("#contest_#{key}")
          el.addClass "field-with-error"
          if key == 'email'
            $(".contest-error").html 'email already exists'
