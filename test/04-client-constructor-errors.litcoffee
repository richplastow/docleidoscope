04 Client Constructor Errors
============================


    tudor.add [
      "04 Client Constructor Errors"
      tudor.throw




      "`config` errors"


      "`config` missing"
      "Client: `config` must be type 'object'"
      -> new Client


      "`config` wrong type"
      "Client: `config` must be type 'object'"
      -> new Client []




      "`config.env` errors"


      "`config.env` missing"
      "Client: `config.env` must be type 'string'"
      -> new Client {}

      "`config.env` wrong type"
      "Client: `config.env` must be type 'string'"
      -> new Client { env:123 }

      "`config.env` string is 'server'"
      "Client: `config.env` must be 'client'"
      -> new Client { env:'server' }

    ]


