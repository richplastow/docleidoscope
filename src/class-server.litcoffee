Server
======

#### A serverside runtime

    class Server extends BaseRuntime
      C: 'Server'

      constructor: (config) ->

Call `BaseRuntime::constructor()`. 

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


#### `wss <xx>`  A function which provides a websocket server
Xx. 

        @wss = config.wss
        if ªF != ªtype @wss
          throw new Error "#{@C}: `config.wss` must be type 'function'"


#### `wsServer <WebSocketServer|null>`  Xx
`start()` must be called to begin serving. 

        @wsServer = null


#### `fs <fs>`  An object which provides filesystem access
We use `existsSync()`, `statSync()`, and `readdirSync()`. 

        @fs = config.fs
        if ªO != ªtype @fs
          throw new Error "#{@C}: `config.fs` must be type 'object'"


#### `dir <string>`  Path to the directory to watch
Xx. 

        @dir = config.dir
        if ªS != ªtype @dir
          throw new Error "#{@C}: `config.dir` must be type 'string'"
        dirRx = /^[-\/_.A-Za-z0-9]{1,128}$/
        if ! dirRx.test @dir #@todo be less strict
          throw new Error "#{@C}: `config.dir` fails #{dirRx}"
        if ! @fs.existsSync @dir
          throw new Error "#{@C}: `config.dir` does not exist"


#### `wait <number>`  The time, in milliseconds, between directory-polling
Xx. 

        @wait = config.wait
        if ªN != ªtype @wait
          throw new Error "#{@C}: `config.wait` must be type 'number'"
        if ! (100 <= @wait <= 1000 * 60 * 60)
          throw new Error "#{@C}: `config.wait` must be 100-#{1000 * 60 * 60}"



#### `stats <fs.Stats>`  Node object containing info about the watch-directory
See https://nodejs.org/api/fs.html#fs_class_fs_stats. 

        @stats = @fs.statSync @dir
        if ! @stats.isDirectory()
          throw new Error "#{@C}: `config.dir` is not a directory"


#### `watcher <intervalObject|null>`  Used by `stop()` to finish polling. 
`start()` must be called to begin polling for directory changes. 
https://nodejs.org/api/timers.html#timers_setinterval_callback_delay_arg. 

        @watcher = null


#### `files <Array>`  The current files in `@dir`
Xx. 

        @files = @fs.readdirSync @dir


#### `xx <xx>`  Xx
Xx. 

        @xx = 'x'




Begin watching
--------------


        



Methods
-------


#### `qq()`
- `xx <xx>`  Xx

Xx. @todo describe

      qq: (xx) ->




#### `stop()`
Start the server watching for directory changes, and responding to ws requests. 

      start: ->

Begin polling `@dir` for changes. 

        @watcher = setInterval @checkDir, @wait

Configure the websocket server. 

        @wsServer = new @wss
          port: 8080

Begin responding to websocket requests. 

        @wsServer.on 'connection', (ws) ->
          ª 'connected'
          ws.send 'thanks for connecting'
          ws.on 'message', (message) ->
            ª 'recieved', message
            ws.send 'thanks for "' + message + '"'




#### `stop()`
Stop the server watching for directory changes, and responding to ws requests. 

      stop: ->

Finsih polling `@dir` for changes. 

        clearInterval @watcher

Disconnect all clients and stop responding to websocket requests. 

        #@todo




#### `checkDir()`
Xx. @todo describe

      checkDir: =>
        filesNow = @fs.readdirSync @dir

Check for removed files. 

        removed = false
        for file in @files
          if -1 == filesNow.indexOf file
            removed = true
            break

Check for added files. 

        added = false
        for fileNow in filesNow
          if -1 == @files.indexOf fileNow
            added = true
            break

Inform clients about the change, and record the new file list. @todo inform clients

        if removed || added
          ª "Files have changed"
          @files = filesNow




#### `onDirChange()`
- `event <string>`       The type of fs change, either 'rename' or 'change'
- `filename <filename>`  The filename that changed (if relevant/available)

Xx. @todo describe

      onDirChange: (evt, filename) ->
        ª evt, filename




