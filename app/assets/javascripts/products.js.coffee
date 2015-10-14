# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.toggleHeader').click ->
    if jQuery(this).is(':contains("-")')
      console.log this
      jQuery(this).children('.plusMinus').text '+'
      jQuery(this).siblings('.openClose').css 'display', 'none'
    else
      console.log this
      jQuery(this).children('.plusMinus').text '-'
      jQuery(this).siblings('.openClose').css 'display', 'block'
    return
  return
