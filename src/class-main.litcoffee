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


#### `runtime <Runtime>`  Instance of the Client or Server class
The app runtime is instantiated differently, depending on the environment. 

        @runtime = new (if 'client' == @env then Client else Server) config




Methods
-------


#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

