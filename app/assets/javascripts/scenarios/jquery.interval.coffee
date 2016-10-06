'use strict'
class @JqueryInterval
  constructor: ->
    return if 0 == $('main strong').length
    setInterval ()=>
      @send()
    , 2500

  send: ->
    jQuery.ajax
      url: '/users/jquery_interval'
      type: 'PATCH'
      data:
        users: @data()
    .done (d)->
      jQuery("main strong[data-id='#{diff.id}']").html(diff.nickname) for diff in d
    .fail (j, s)->
      console.error(j.responseText || s) if 200 != j.status

  data: ->
    ret = {}
    for strong in jQuery('main strong[data-id]')
      if !ret[jQuery(strong).data('id')]?
        ret[jQuery(strong).data('id')] = strong.innerHTML
    ret
