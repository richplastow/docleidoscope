ClientRuntime
=============

#### A clientside runtime

    class ClientRuntime extends BaseRuntime
      C: 'ClientRuntime'

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



#### `I <string|null>`  Xx
Assigned by the server when connected. 

        @ID = null



#### `files <array>`  Xx
Xx. 

        @files = []



#### `listeners <object>`  Xx
Xx. 

        @listeners = {}



#### `xx <xx>`  Xx
Xx. 

        @xx = 'xx'




Methods
-------


#### `start()`
Start the client playing back media, and connecting via websockets. 

      start: ->
        # 

Connecting to the server via websockets. 

        @wsc = new WebSocket 'ws://127.0.0.1:8080' #@todo polyfill

Listen for connection and disconection events. 

        @wsc.onopen = (evt) ->
          ª 'CONNECTED'
        @wsc.onclose = (evt) ->
          @ID = null
          ª 'DISCONNECTED'

Listen for an error. 

        @wsc.onerror = (evt) ->
          ª 'ERROR: ', evt

Listen for various types of message from the server. 

- An ID-assign message @todo use the ID?
- An files-update message
- Any other message

        @wsc.onmessage = (evt) => # note `=>` not `->`

          if 'You are: ' == evt.data.slice 0, 9
            @ID = evt.data.slice 9
            ª 'ASSIGNED ID: ' + @ID
            @wsc.send 'I am ' + @ID

          else if 'Update files: ' == evt.data.slice 0, 14
            @files = JSON.parse evt.data.slice 14
            if @listeners.update
              updateListener() for updateListener in @listeners.update
            ª 'UPDATE FILES: ', @files

          else
            ª 'UNEXPECTED MESSAGE: ' + evt.data




#### `stop()`
Stop the client playing back media, and connecting via websockets. 

      stop: ->
        # 

Finish connecting via websockets. 

        @wsc.close()
        @wsc = null




#### `on()`
- `evt <string>`  Xx
- `cb <function>`  Xx

Xx. 

      on: (evt, cb) ->
        if ! @listeners[evt] then @listeners[evt] = []
        @listeners[evt].push cb




#### `xx()`
- `xx <xx>`  Xx

Xx. 

      xx: (xx) ->

