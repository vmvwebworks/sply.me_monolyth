App.join = App.cable.subscriptions.create "JoinChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    $('#join_list_table').empty()
    joinLists = data['joinLists']
    for joinList in joinLists
      console.log joinList
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
            <ul class='tabs row' id='tabs-swipe-demo'>
              <li class='tab col s6 grey lighten-2'>
                <a href='#test-swipe-1'>Waiting list</a>
              </li>
              <li class='tab col s6 amber lighten-1'>
                <a href='#test-swipe-2' class='active'>Accept</a>
              </li>
            </ul>
            <div class='col s12' id='#test-swipe-1'>
              <ul id='#joinings' class='collection'>
              </ul>
            </div>
            <div id='#test-swipe-2' class='col s12 center-align'>
             <p class='flow-text'>The user accepted the request</p>
             <h5>Charge AMMOUNT</h5>
             <div class='row'>
              <div class='col s3 offset-s9'>
              </div>
             </div>
            </div>
          </div>
        </div>")
      # joinings = joinList['joinings']
      # for joining in joinings
      #   $('#joinings').append("<li><a class='collection-item center-align'>#{joining['user']['name']}</a></li>")
      $('').click ->
        $("#modal#{joinList['list']['id']}").modal('open');
        joinListId = $(this).attr('id')
        App.join.joinTheList joinListId

  # Called when there's incoming data on the websocket for this channel
  joinTheList: (listId) ->
    @perform "join", list_id: listId
  leave: ->

document.addEventListener 'turbolinks:load', ->
  $('.modal').modal opacity: 0
  App.join.perform "render_all"
  $('#query').on 'keyup', ->
    value = $(this).val().toLowerCase()
    $('tr').filter ->
      $(this).toggle $(this).text().toLowerCase().indexOf(value) > -1


$(document).ready ->
  $('.modal').modal opacity: 0
