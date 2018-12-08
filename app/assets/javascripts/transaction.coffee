# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  #Ropsten search button
  $('#btn-search2').on('click' , (e)->
    $('input.mode').val('ropsten')
  )
