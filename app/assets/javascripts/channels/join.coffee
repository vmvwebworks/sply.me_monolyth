App.join = App.cable.subscriptions.create "JoinChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#join_list_table').empty()
    this.render_list(data)
    $(".modal-trigger").click ->
      joinListId = $(this).attr('id')
      App.join.joinTheList joinListId
  # Called when there's incoming data on the websocket for this channel

  joinTheList: (listId) ->
    @perform "join", list_id: listId
    $('.modal').modal opacity: 0
  leave: ->

  render_list: (data) ->
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
            <a class='modal-trigger' id='#{joinList['list']['id']}' href='#modal#{joinList['list']['id']}' >
             Join
            </a>
          </td>
        </tr>
        ")
      $('main').append(
        "<div class='modal z-depth-0' id='modal#{joinList['list']['id']}'>
          <div class='modal-content'>
            <div class='col s12'>
              <ul id='joinings#{joinList['list']['id']}' class='collection with-header'>
                <li class='collection-header'><h4>Join list</h4></li>
              </ul>
            </div>
          </div>
        </div>")
      joinings = joinList['joinings']
      for joining in joinings
        $("#user_#{joining['user']['id']}_joining").remove();
        $("#joinings#{joinList['list']['id']}").append("<li id='user_#{joining['user']['id']}_joining'><a class='collection-item z-depth-0 center-align'>#{joining['user']['name']}</a></li>")

document.addEventListener 'turbolinks:load', ->
  App.join.perform "render_all"
  $('#query').on 'keyup', ->
    value = $(this).val().toLowerCase()
    $('tr').filter ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1
