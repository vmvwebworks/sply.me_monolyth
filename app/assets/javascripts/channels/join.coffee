App.join = App.cable.subscriptions.create "JoinChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
  joinTheList: (listId) ->
    @perform "join", list_id: listId
  leave: ->

document.addEventListener 'turbolinks:load', ->
  $('.modal').modal opacity: 0
  $('.modal-trigger').click ->
    joinListId = $(this).attr('id')
    console.log joinListId
    App.join.joinTheList joinListId
    return
  $('#query').on 'keyup', ->
    value = $(this).val().toLowerCase()
    $('tr').filter ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1
