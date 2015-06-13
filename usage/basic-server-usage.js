//// Run this on the server:
//// $ node usage/basic-server-usage.js

var Docleidoscope = require('../../docleidoscope');
var docleidoscope = new Docleidoscope({
  env:    'server',
  dir:    'usage/movies/',
  delay:  1000,
  fs:     require('fs'),
});
console.log( docleidoscope.C ); // Docleidoscope

