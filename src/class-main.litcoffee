Main
====

#### The main class for Docleidoscope

    class Main
      C: ªC
      toString: -> "[object #{@C}]"

      constructor: (config) ->

        if ªO != ªtype config
          throw new Error "#{@C}: `config` must be type 'object'"



Properties
----------


#### `env <string>`  Must be 'client' or 'server'
The runtime environment, which must be set during instantiation. 

        @env = config.env
        if ªS != ªtype @env
          throw new Error "#{@C}: `config.env` must be type 'string'"
        if ! /^client|server$/.test @env
          throw new Error "#{@C}: `config.env` must be 'client' or 'server'"


#### `runtime <ClientRuntime|ServerRuntime>`  Instance of the Runtime subclasses
The app runtime is instantiated differently, depending on the environment. 

        if 'client' == @env
          @runtime = new ClientRuntime config
        else
          @runtime = new ServerRuntime config




Methods
-------


#### `start()`
Start the server serving, or the client playing back media. 

      start: ->
        @runtime.start()




#### `stop()`
Stop the server serving, or the client playing back media. 

      stop: ->
        @runtime.stop()




#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

