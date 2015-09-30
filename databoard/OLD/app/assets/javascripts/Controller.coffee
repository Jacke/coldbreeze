# Contains the actual business logic of the main page
define ["page", "sumWebSocket", "docEventWebSocket"], (page, sumWebSocket, docEventWebSocket) ->

  ws = undefined

  doc = undefined

  bind = () ->
    page.showLogin()
    page.hideConnecting()
    page.hideSum()

    page.onConnectClicked () ->

      page.hideLogin()
      page.showConnecting()

      ws = new sumWebSocket(page.getPassword())

      doc = new docEventWebSocket(page.getPassword())

      doc.onConnected () ->
        page.hideConnecting()
        console.log("Connected")
        page.showSum()

      doc.onResult (result, color) ->
        console.log(color)
        console.log("result")
        console.log(result)
        page.emptyResults
        $("#sumResult").empty()
        page.setSumResult(result, color)

      doc.onClose () ->
        page.showLogin()
        page.hideSum()
        page.hideConnecting()





      ws.onConnected () ->
        page.hideConnecting()
        page.showSum()

      ws.onResult (result, color) ->
        page.setSumResult(result, color)

      ws.onClose () ->
        page.showLogin()
        page.hideSum()
        page.hideConnecting()

    page.onSubmitSum () ->
      values = page.getSumValues().split(/[, ]+/)
      valueInts = values.map((v) -> parseInt(v))
        .filter((v) -> !isNaN(v))
      doc.event(valueInts)
      ws.sum(valueInts)

    page.onDisconnectClicked () ->
      ws.disconnect()
      doc.disconnect()
      page.hideSum()
      page.showLogin()

  {
    bind: bind
  }
