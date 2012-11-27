# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".table-change-data input[type='number']").change ->
    val = $(this).val()
    root = $(this).closest("td")
    root.next().text(val - parseInt(root.prev().text()) )