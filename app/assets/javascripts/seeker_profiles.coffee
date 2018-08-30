# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  id = 0
  $('form').on 'click', '.add_fields', (event) ->
    id += 1
    $link = $(this).find('a')
    regexp = new RegExp($link.data('id'), 'g')
    $(this).before($link.data('fields').replace(regexp, id))
    event.preventDefault()
