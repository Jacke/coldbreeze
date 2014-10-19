define () ->
  class SumWebSocket
    constructor: (password) ->
      @ws = new WebSocket("ws://localhost:9000/sum/" + password)

    onConnected: (callback) ->
      @ws.onopen = callback

    onClose: (callback) ->
      @ws.onclose = callback

    disconnect: () ->
      @ws.close()

    sum: (values) ->
      @ws.send JSON.stringify
        values: values

    onResult: (callback) ->
      @ws.onmessage = (msg) ->
        console.log(msg)
        result = JSON.parse(msg.data)
        console.log(result)
        callback(result.sum, result.color)