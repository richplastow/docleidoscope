02 Docleidoscope Constructor Errors
===================================


    tudor.add [
      "02 Docleidoscope Constructor Errors"
      tudor.throw




      "`config` errors"


      "`config` missing"
      "Docleidoscope: `config` must be type 'object'"
      -> new Main


      "`config` wrong type"
      "Docleidoscope: `config` must be type 'object'"
      -> new Main []




      "`config.env` errors"


      "`config.env` missing"
      "Docleidoscope: `config.env` must be type 'string'"
      -> new Main {}

      "`config.env` wrong type"
      "Docleidoscope: `config.env` must be type 'string'"
      -> new Main { env:123 }

      "`config.env` string not recognized"
      "Docleidoscope: `config.env` must be 'client' or 'server'"
      -> new Main { env:'wrong' }

    ]


