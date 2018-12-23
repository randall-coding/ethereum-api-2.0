# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  #Callbacks
  $('a.examples').on('click' , ->
    $('div.popup-txhash').slideToggle()
  )

  $('#btn-search1').on('click', ->
    $('div.popup-txhash').slideUp()
  )
