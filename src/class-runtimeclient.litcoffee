Client
======

#### A clientside runtime

    class Client extends Runtime
      C: 'Client'

      constructor: (config) ->

Call `Runtime.constructor()`. 

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


#### `xx <xx>`  Xx
Xx. 

        @xx = 'xx'




Methods
-------


#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

