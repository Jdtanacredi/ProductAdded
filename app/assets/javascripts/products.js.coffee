# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  changeImage = ->
    className = $(this).attr('class').split(' ')[1]
    
    return

  $('.productThumb').click changeImage

  $('.toggleHeader').click ->
    if jQuery(this).is(':contains("-")')
      jQuery(this).children('.plusMinus').text '+'
      jQuery(this).siblings('.openClose').css 'display', 'none'
    else
      jQuery(this).children('.plusMinus').text '-'
      jQuery(this).siblings('.openClose').css 'display', 'block'
    return

return


#
# $('.productThumb').click ->
#   console.log 'meow'
#   return
