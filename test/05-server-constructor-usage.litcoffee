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
          wait: 1000
          wss: ->
            on: ->
          fs:
            existsSync: -> true
            readdirSync: -> []
            statSync: ->
              isDirectory: -> true




      "Changes made to watched directory"
      tudor.equal


      "New file added after 300ms"
      '@todo async Tudor feature'
      ->
        server = new Server
          env: 'server'
          dir: 'path/to/watch'
          wait: 100
          wss: ->
            on: ->
          fs:
            existsSync: -> true
            readdirSync: ->
              #if @__test then @__test++ else @__test = 1
              #if 3 < @__test
              #  ['a.mp4','b.mp4']
              #else
              #  ['a.mp4']
            statSync: ->
              isDirectory: -> true

        #server.start()
        #setTimeout (-> server.stop()), 500 # prevent polling forever
        '@todo async Tudor feature'

    ]
