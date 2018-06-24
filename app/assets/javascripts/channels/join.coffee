App.join = App.cable.subscriptions.create "JoinChannel",
  connected: ->
    @perform "render_all"
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#join_list_table').empty()
    joinLists = data['joinLists']
    for joinList in joinLists
      $('#join_list_table').append(
        "<tr>
          <td>#{joinList['user']['name']}</td>
          <td>#{joinList['user']['email']}</td>
          <td>#{joinList['user']['language']}</td>
          <td>#{joinList['user']['country_code']}</td>
          <td>#{joinList['user']['price']}</td>
          <td>#{joinList['user']['currency']}</td>
          <td>
            <a class='modal-trigger' id='#{joinList['list']['id']}' href=#joinList#{joinList['list']['id']} >
             Join
            </a>
          </td>
        </tr>
        ")
    $('.modal-trigger').click ->
      console.log("eeeeeaa")
      joinListId = $(this).attr('id')
      App.join.joinTheList joinListId
  # Called when there's incoming data on the websocket for this channel
  joinTheList: (listId) ->
    @perform "join", list_id: listId
  leave: ->

document.addEventListener 'turbolinks:load', ->
  App.join.perform "render_all"
  $('#query').on 'keyup', ->
    value = $(this).val().toLowerCase()
    $('tr').filter ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1
  # $('.modal').modal opacity: 0
  $('.modal-trigger').click ->
    console.log("eeeeeaa")
