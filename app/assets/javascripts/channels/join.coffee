App.join = App.cable.subscriptions.create "JoinChannel",
  connected: ->
    @perform "render_all"
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    joinLists = data['joinLists']
    $('#join_list_table').empty()
    for joinList in joinLists
      $('#join_list_table').append(
        "<tr>
          <td>#{joinList['user']['name']}</td>
          <td>#{joinList['user']['email']}</td>
          <td>#{joinList['user']['language']}</td>
          <td>#{joinList['user']['country_code']}</td>
          <td>#{joinList['user']['price']}</td>
          <td>#{joinList['user']['currency']}</td>
        </tr>
        ")
  # Called when there's incoming data on the websocket for this channel
  joinTheList: (listId) ->
    @perform "join", list_id: listId
  leave: ->

document.addEventListener 'turbolinks:load', ->
  App.join.perform "render_all"
  $('.modal').modal opacity: 0
  # $('.modal-trigger').click ->
  #   joinListId = $(this).attr('id')
  $('#query').on 'keyup', ->
    value = $(this).val().toLowerCase()
    $('tr').filter ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1
