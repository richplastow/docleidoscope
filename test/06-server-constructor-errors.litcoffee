04 Server Constructor Errors
============================


    tudor.add [
      "04 Server Constructor Errors"
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

    ]


