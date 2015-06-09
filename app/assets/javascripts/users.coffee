# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

r = ->
  $('[data-toggle="popover"]').popover()

  $('.cloudinary-fileupload').bind 'cloudinarydone', (e, data) ->
    console.log data.result
    $('.img').html $.cloudinary.image(data.result.public_id,
      format: data.result.format
      version: data.result.version).addClass('img-responsive profile-photo')
    $('.upload_section').hide()
    $('.drag_inner > div').toggleClass 'hide'
    $('.image_public_id').val data.result.public_id
    $('.image_id').val data.result.public_id
    $('.profile-photo').load ->
      $('.img-container').height ''

  $('.cloudinary-fileupload').bind 'fileuploadprogress', (e, data) ->
    console.log 'Uploading...'
    $('.progress-bar').css 'width', Math.round(data.loaded * 100.0 / data.total) + '%'

  $('.drag_area').bind 'dragover', ->
    $(@).addClass 'hover'
    $(@).addClass 'hover_text'

  $('.drag_area').bind 'dragleave', ->
    $(@).removeClass 'hover'
    $(@).removeClass 'hover_text'

  $('.drag_area').bind 'drop', ->
    $(@).removeClass 'hover'
    $(@).removeClass 'hover_text'
    $('.drag_inner > div').toggleClass 'hide'
    $('.img-container').height $('.profile-photo').height()

  $('#change-picture').click (e) ->
    e.preventDefault()
    $('.upload_section').css 'position', 'absolute'
    $('.profile-photo').fadeOut(500)
    $('.upload_section').fadeIn 500, ->
      $(@).css 'position', 'relative'


$(document).ready(r)
$(document).on('page:load', r)