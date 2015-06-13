//// Run this on the server:
//// $ node usage/basic-server-usage.js

var Docleidoscope = require('../../docleidoscope');
var docleidoscope = new Docleidoscope({
  env: 'server'
});
console.log( docleidoscope.C ); // Docleidoscope

