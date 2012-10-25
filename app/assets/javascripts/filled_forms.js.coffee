# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
updateWrappers = ->
  switch $('#verification-radio :checked').val()
    when "false"
      $('#verification-status-wrapper').show()
      $('#progress-wrapper').hide()
    when "true"
      $('#verification-status-wrapper').hide()
      $('#progress-wrapper').show()
    when "nil"
      $('#progress-wrapper').hide()
      $('#verification-status-wrapper').hide()

  if $('#confirmation_radio :checked').val() is "false"
    $('#confirmation_wrapper').show()
  else
    $('#confirmation_wrapper').hide()

jQuery ->
  updateWrappers()
  $(':radio').click -> updateWrappers()
  $('.attachinary-input').attachinary()

