WsClient
========

#### Represents a websocket client

    class WsClient
      C: 'WsClient'

      constructor: (config) ->




Properties
----------


#### `ID <string>`  Xx
Xx. 

        @ID = ªuid @C


#### `allowed <object>`  Xx
Allowed movie extensions. 

        @allowed =
          mp4: yes




Methods
-------


#### `filesUpdate()`
- `files <Array>`  The new list of files. 

Xx. @todo describe

      filesUpdate: (files) ->
        ok = []
        for file in files
          ext = file.split('.').pop().toLowerCase()
          if ext && @allowed[ext] then ok.push file
        @ws.send 'Update files: ' + JSON.stringify ok



#### `init()`
- `xx <xx>`  Xx

Xx. @todo describe

      init: (xx) ->

