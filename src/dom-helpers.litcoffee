DOM Helpers
===========

#### Helper functions for the HTML Document Object Model



#### Roughly polyfill `document` for Node etc. 

    if ! document then document =
      querySelector:
        bind: ->
      querySelectorAll:
        bind: ->



#### `$()`
Xx. 

    $ = document.querySelector.bind document




#### `$$()`
Xx. 

    $$ = document.querySelectorAll.bind document




