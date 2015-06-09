# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

r = ->
  $('[data-toggle="popover"]').popover()

  showLoading = ->
    $('.drag-inner > div').toggleClass 'hide'
    $('.img-container').height $('.profile-photo').height()

  $('.cloudinary-fileupload').bind 'cloudinarydone', (e, data) ->
    console.log data.result
    $('.img').html $.cloudinary.image(data.result.public_id,
      format: data.result.format
      version: data.result.version).addClass('img-responsive profile-photo')
    $('.upload-section').hide()
    $('.drag-inner > div').toggleClass 'hide'
    $('.image_public_id').val data.result.public_id
    $('.image_id').val data.result.public_id
    $('.profile-photo').load ->
      $('.img-container').height ''

  $('.cloudinary-fileupload').bind 'fileuploadprogress', (e, data) ->
    console.log 'Uploading...'
    $('.progress-bar').css 'width', Math.round(data.loaded * 100.0 / data.total) + '%'

  $('.drag-area').bind 'dragover', ->
    $(@).addClass 'hover'

  $('.drag-area').bind 'dragleave', ->
    $(@).removeClass 'hover'

  $('.drag-area').bind 'drop', ->
    $(@).removeClass 'hover'
    showLoading()

  $('.image_upload').change ->
    showLoading()

  $('#change-picture').click (e) ->
    e.preventDefault()
    $('.upload-section').css 'position', 'absolute'
    $('.profile-photo').fadeOut(500)
    $('.upload-section').fadeIn 500, ->
      $(@).css 'position', 'relative'


$(document).ready(r)
$(document).on('page:load', r)