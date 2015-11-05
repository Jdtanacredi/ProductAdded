$(document).ready ->
  $('.contest-submit').attr 'disabled', 'disabled'
  $('#policy').change ->
    console.log this.checked
    if this.checked == true
      $('.contest-submit').removeAttr 'disabled', 'disabled'
    else
      $('.contest-submit').attr 'disabled', 'disabled'
    return


  $("form#new_contest").on "submit", (e) ->
    console.log 'meow'
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
