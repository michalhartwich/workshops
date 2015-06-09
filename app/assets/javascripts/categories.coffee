# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

r = ->
  $('#new-product').click (e) ->
    e.preventDefault()
    $('#new-product-form')
      .fadeIn(500)
      .removeClass('hide')
    $('html, body').animate
      scrollTop: $("#new-product-form").offset().top
      2000


$(document).ready(r)
$(document).on('page:load', r)