Server
======

#### A serverside runtime

    class Server extends Runtime
      C: 'Server'

      constructor: (config) ->

Call `Runtime.constructor()`. 

        super config



Properties
----------


#### `env <string>`  Must be 'server'
The runtime environment, which must be set during instantiation. 

        @env = config.env
        if ªS != ªtype @env
          throw new Error "#{@C}: `config.env` must be type 'string'"
        if ! /^server$/.test @env
          throw new Error "#{@C}: `config.env` must be 'server'"


#### `xx <xx>`  Xx
Xx. 

        @xx = 'xx'




Methods
-------


#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

