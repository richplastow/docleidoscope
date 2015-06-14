04 ClientRuntime Constructor Errors
===================================


    tudor.add [
      "04 ClientRuntime Constructor Errors"
      tudor.throw




      "`config` errors"


      "`config` missing"
      "ClientRuntime: `config` must be type 'object'"
      -> new ClientRuntime


      "`config` wrong type"
      "ClientRuntime: `config` must be type 'object'"
      -> new ClientRuntime []




      "`config.env` errors"


      "`config.env` missing"
      "ClientRuntime: `config.env` must be type 'string'"
      -> new ClientRuntime {}

      "`config.env` wrong type"
      "ClientRuntime: `config.env` must be type 'string'"
      -> new ClientRuntime { env:123 }

      "`config.env` string is 'server'"
      "ClientRuntime: `config.env` must be 'client'"
      -> new ClientRuntime { env:'server' }

    ]


