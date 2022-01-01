# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#buy_alert').dataTable({
        pagingType: 'full_numbers', 
        order: [[ 5, "desc" ],[ 0, "asc"]]
        })