Client
======

#### A clientside runtime

    class Client extends BaseRuntime
      C: 'Client'

      constructor: (config) ->

Call `BaseRuntime::constructor()`. 

        super config



Properties
----------


#### `env <string>`  Must be 'client'
The runtime environment, which must be set during instantiation. 

        @env = config.env
        if ªS != ªtype @env
          throw new Error "#{@C}: `config.env` must be type 'string'"
        if ! /^client$/.test @env
          throw new Error "#{@C}: `config.env` must be 'client'"




#### `wsc <WebSocket|null>`  Xx
Xx. 

        @wsc = null



#### `xx <xx>`  Xx
Xx. 

        @xx = 'xx'




Methods
-------


#### `start()`
Start the client playing back media, and connecting via websockets. 

      start: ->
        # 

Begin connecting via websockets. 

        @wsc = new WebSocket 'ws://127.0.0.1:8080' #@todo polyfill
        @wsc.onopen = (evt) => # note `=>` not `->`
          ª 'CONNECTED'
          @wsc.send '123 Testing'
        @wsc.onclose = (evt) ->
          ª 'DISCONNECTED'
        @wsc.onmessage = (evt) ->
          ª 'RECEIVED: ' + evt.data
        @wsc.onerror = (evt) ->
          ª 'ERROR: ', evt




#### `stop()`
Stop the client playing back media, and connecting via websockets. 

      stop: ->
        # 

Finish connecting via websockets. 

        @wsc.close()
        @wsc = null




#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

