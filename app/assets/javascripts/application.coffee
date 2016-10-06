#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require_tree ./scenarios

'use strict'
(($) ->
  $(document).on 'turbolinks:load', ->
    scenarios =
      jquery_interval: JqueryInterval
      action_cable: WithActionCable
    try
      new scenarios[(location.hash[1..-1] if location.hash?) || 'jquery_interval']
    catch error
      console.error error

  $(document).on 'change input paste', 'input[data-id]', (e)->
    $.ajax
      url: "/users/#{$(@).data('id')}"
      type: 'PUT'
      data:
        users:
          nickname: @value
    .fail (j, s)->
      console.error(j.responseText || s) if 200 != j.status
  $(document).on 'click', 'header a', (e)->
    document.location.reload()
) jQuery
