06 ServerRuntime Constructor Errors
===================================


    tudor.add [
      "06 ServerRuntime Constructor Errors"
      tudor.throw




      "`config` errors"


      "`config` missing"
      "ServerRuntime: `config` must be type 'object'"
      -> new ServerRuntime


      "`config` wrong type"
      "ServerRuntime: `config` must be type 'object'"
      -> new ServerRuntime []




      "`config.env` errors"


      "`config.env` missing"
      "ServerRuntime: `config.env` must be type 'string'"
      -> new ServerRuntime {}

      "`config.env` wrong type"
      "ServerRuntime: `config.env` must be type 'string'"
      -> new ServerRuntime { env:123 }

      "`config.env` string is 'client'"
      "ServerRuntime: `config.env` must be 'server'"
      -> new ServerRuntime { env:'client' }




      "`config.dir` errors"


      "`config.dir` missing"
      "ServerRuntime: `config.dir` must be type 'string'"
      -> new ServerRuntime
        env: 'server'
        wss: ->
          on: ->
        fs:  {}

      "`config.dir` wrong type"
      "ServerRuntime: `config.dir` must be type 'string'"
      -> new ServerRuntime
        env: 'server'
        dir: true
        wss: ->
          on: ->
        fs:  {}

      "`config.dir` is an empty string"
      "ServerRuntime: `config.dir` fails /^[-\\\/_.A-Za-z0-9]{1,128}$/"
      -> new ServerRuntime
        env: 'server'
        dir: ''
        wss: ->
          on: ->
        fs:  {}

      "`config.dir` string contains unexpected characters" #@todo will be less strict
      "ServerRuntime: `config.dir` fails /^[-\\\/_.A-Za-z0-9]{1,128}$/"
      -> new ServerRuntime
        env: 'server'
        dir: 'nöpe'
        wss: ->
          on: ->
        fs:  {}


      "`config.dir` points to non-existant dir"
      "ServerRuntime: `config.dir` does not exist"
      -> new ServerRuntime
        env: 'server'
        dir: 'does/not/exist'
        wss: ->
          on: ->
        fs:
          existsSync: -> false


      "`config.dir` points to a file, not a dir"
      "ServerRuntime: `config.dir` is not a directory"
      -> new ServerRuntime
        env: 'server'
        dir: 'is/not/a/dir'
        wait: 1000
        wss: ->
          on: ->
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> false




      "`config.fs` errors"


      "`config.fs` missing"
      "ServerRuntime: `config.fs` must be type 'object'"
      -> new ServerRuntime
        env: 'server'
        dir: 'path/to/files'
        wss: ->
          on: ->


      "`config.fs` wrong type"
      "ServerRuntime: `config.fs` must be type 'object'"
      -> new ServerRuntime
        env: 'server'
        dir: 'path/to/files'
        wss: ->
          on: ->
        fs:  []




      "`config.wss` errors"


      "`config.wss` missing"
      "ServerRuntime: `config.wss` must be type 'function'"
      -> new ServerRuntime
        env: 'server'
        dir: 'path/to/files'


      "`config.wss` wrong type"
      "ServerRuntime: `config.wss` must be type 'function'"
      -> new ServerRuntime
        env: 'server'
        dir: 'path/to/files'
        wss:
          on: ->




      "`config.wait` errors"


      "`config.wait` missing"
      "ServerRuntime: `config.wait` must be type 'number'"
      -> new ServerRuntime
        env: 'server'
        dir: 'is/a/dir'
        wss: ->
          on: ->
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.wait` wrong type"
      "ServerRuntime: `config.wait` must be type 'number'"
      -> new ServerRuntime
        env: 'server'
        dir: 'is/a/dir'
        wait: '1000'
        wss: ->
          on: ->
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.wait` too small"
      "ServerRuntime: `config.wait` must be 100-3600000"
      -> new ServerRuntime
        env: 'server'
        dir: 'is/a/dir'
        wait: 99.99
        wss: ->
          on: ->
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.wait` too big"
      "ServerRuntime: `config.wait` must be 100-3600000"
      -> new ServerRuntime
        env: 'server'
        dir: 'is/a/dir'
        wait: 1000 * 60 * 60 + 0.1
        wss: ->
          on: ->
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

    ]


