# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

r = ->
  $drag_inner_div = $('.drag-inner > div')
  $cloudinary_fileupload = $('.cloudinary-fileupload')
  $img_container = $('.img-container')
  $upload_section = $('.upload-section')
  $drag_area = $('.drag-area')
  $progress_bar = $('.progress-bar')
  $change_picture = $('#change-picture')
  $profile_photo = null

  $(window).load ->
    $profile_photo = $('.profile-photo')

  showLoading = ->
    $drag_inner_div.toggleClass 'hide'
    $img_container.height $profile_photo.height()

  $cloudinary_fileupload.bind 'cloudinarydone', (e, data) ->
    $('.img').html $.cloudinary.image(data.result.public_id,
      format: data.result.format
      version: data.result.version).addClass('img-responsive profile-photo')
    $upload_section.hide()
    $drag_inner_div.toggleClass 'hide'
    $('#user_image_id').val data.result.public_id
    $('.profile-photo').load ->
      $img_container.height ''
      $profile_photo = $('.profile-photo')

  $cloudinary_fileupload.bind 'fileuploadprogress', (e, data) ->
    $progress_bar.css 'width', Math.round(data.loaded * 100.0 / data.total) + '%'

  $drag_area.bind 'dragover', ->
    $(@).addClass 'hover'

  $drag_area.bind 'dragleave', ->
    $(@).removeClass 'hover'

  $drag_area.bind 'drop', ->
    $(@).removeClass 'hover'
    showLoading()

  $('.image_upload').change ->
    showLoading()

  $change_picture.popover()

  $change_picture.click (e) ->
    e.preventDefault()
    $upload_section.css 'position', 'absolute'
    $profile_photo.fadeOut 500
    $upload_section.fadeIn 500, ->
      $(@).css 'position', 'relative'


$(document).ready(r)
$(document).on('page:load', r)