App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  # Called when the subscription is ready for use on the server
  connected: ->
    @appear()

  # Called when the WebSocket connection is closed
  disconnected: ->

  # Called when the subscription is rejected by the server
  rejected: ->
    @uninstall()

  appear: ->
    # Calls `AppearanceChannel#appear(data)` on the server
    @perform("appear", appearing_on: $(".appearer").data("appearing-on"))

  away: ->
    # Calls `AppearanceChannel#away` on the server
    @perform("away")


  uninstall: ->
    $(document).off(".appearance")
