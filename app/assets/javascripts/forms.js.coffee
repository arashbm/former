# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('ul#fields').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.ajax
        url: $(this).data('update-url')
        type: 'PUT'
        data: $(this).sortable('serialize')
        success: ->
          console.log 'success!!'
