06 Server Constructor Errors
============================


    tudor.add [
      "06 Server Constructor Errors"
      tudor.throw




      "`config` errors"


      "`config` missing"
      "Server: `config` must be type 'object'"
      -> new Server


      "`config` wrong type"
      "Server: `config` must be type 'object'"
      -> new Server []




      "`config.env` errors"


      "`config.env` missing"
      "Server: `config.env` must be type 'string'"
      -> new Server {}

      "`config.env` wrong type"
      "Server: `config.env` must be type 'string'"
      -> new Server { env:123 }

      "`config.env` string is 'client'"
      "Server: `config.env` must be 'server'"
      -> new Server { env:'client' }




      "`config.dir` errors"


      "`config.dir` missing"
      "Server: `config.dir` must be type 'string'"
      -> new Server
        env: 'server'
        fs:  {}

      "`config.dir` wrong type"
      "Server: `config.dir` must be type 'string'"
      -> new Server
        env: 'server'
        dir: true
        fs:  {}

      "`config.dir` is an empty string"
      "Server: `config.dir` fails /^[-\\\/_.A-Za-z0-9]{1,128}$/"
      -> new Server
        env: 'server'
        dir: ''
        fs:  {}

      "`config.dir` string contains unexpected characters" #@todo will be less strict
      "Server: `config.dir` fails /^[-\\\/_.A-Za-z0-9]{1,128}$/"
      -> new Server
        env: 'server'
        dir: 'nöpe'
        fs:  {}


      "`config.dir` points to non-existant dir"
      "Server: `config.dir` does not exist"
      -> new Server
        env: 'server'
        dir: 'does/not/exist'
        fs:
          existsSync: -> false


      "`config.dir` points to a file, not a dir"
      "Server: `config.dir` is not a directory"
      -> new Server
        env: 'server'
        dir: 'is/not/a/dir'
        delay: 1000
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> false




      "`config.fs` errors"


      "`config.fs` missing"
      "Server: `config.fs` must be type 'object'"
      -> new Server
        env: 'server'
        dir: 'path/to/files'


      "`config.fs` wrong type"
      "Server: `config.fs` must be type 'object'"
      -> new Server
        env: 'server'
        dir: 'path/to/files'
        fs:  []




      "`config.delay` errors"


      "`config.delay` missing"
      "Server: `config.delay` must be type 'number'"
      -> new Server
        env: 'server'
        dir: 'is/a/dir'
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.delay` wrong type"
      "Server: `config.delay` must be type 'number'"
      -> new Server
        env: 'server'
        dir: 'is/a/dir'
        delay: '1000'
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.delay` too small"
      "Server: `config.delay` must be 100-3600000"
      -> new Server
        env: 'server'
        dir: 'is/a/dir'
        delay: 99.99
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

      "`config.delay` too big"
      "Server: `config.delay` must be 100-3600000"
      -> new Server
        env: 'server'
        dir: 'is/a/dir'
        delay: 1000 * 60 * 60 + 0.1
        fs:
          existsSync: -> true
          statSync: ->
            isDirectory: -> true

    ]


