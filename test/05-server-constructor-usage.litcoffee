05 Server Constructor Usage
===========================


    tudor.add [
      "05 Server Constructor Usage"
      tudor.is




      "The class and instance are expected types"


      "The class is a function"
      ªF
      -> Server

      "The instance is an object"
      ªO
      ->
        server = new Server
          env: 'server'
          dir: 'path/to/watch'
          delay: 1000
          fs:
            existsSync: -> true
            readdirSync: -> []
            statSync: ->
              isDirectory: -> true
        server.stop() # prevent directory-watcher loop from polling forever
        server

    ]
