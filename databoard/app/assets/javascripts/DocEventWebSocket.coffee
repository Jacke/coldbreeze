define () ->
  class DocEventWebSocket
    constructor: (password) ->
      @doc = new WebSocket("ws://localhost:9000/doc/" + password)

    onConnected: (callback) ->
      @doc.onopen = callback

    onClose: (callback) ->
      @doc.onclose = callback

    disconnect: () ->
      @doc.close()

    event: (values) ->
      console.log(values)
      @doc.send JSON.stringify
        values: values

    onResult: (callback) ->
      @doc.onmessage = (msg) ->
        console.log(msg)
        result = JSON.parse(msg.data)
        console.log(result)
        callback(result.sum, result.color)