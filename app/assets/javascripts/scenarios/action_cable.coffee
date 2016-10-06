#= require action_cable
#= require_tree ./../channels

'use strict'
class @WithActionCable # because ActionCable already reserved
  constructor: ->
    @App || @App = {}
    @App.cable = ActionCable.createConsumer()
    @App.cable.subscriptions.create
      channel: 'UsersChannel'
    , received: (d)->
      el.innerHTML = d.user_params.nickname for el in document.querySelectorAll("main strong[data-id='#{d.user_params.id}']") if d.user_params?
