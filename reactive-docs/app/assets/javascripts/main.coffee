require.config {
  paths: {
    page: "./Page"
    controller: "./Controller"
    docEventWebSocket: "./DocEventWebSocket"
    sumWebSocket: "./SumWebSocket"
    jquery: "../lib/jquery/jquery"
  }
  shim: {
    bootstrap: {
      deps: ["jquery"]
    }
    jquery: {
      exports: "$"
    }
  }
}

require ["controller"], (controller) ->

  controller.bind()