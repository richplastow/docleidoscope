// Generated by CoffeeScript 1.9.2

/*! Docleidoscope 0.0.5 //// MIT Licence //// https://github.com/richplastow/docleidoscope#readme */

(function() {
  var BaseRuntime, ClientRuntime, Main, ServerRuntime, ª, ªA, ªB, ªC, ªE, ªF, ªN, ªO, ªR, ªS, ªU, ªV, ªX, ªex, ªhas, ªredefine, ªtype, ªuid,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ªC = 'Docleidoscope';

  ªV = '0.0.5';

  ªA = 'array';

  ªB = 'boolean';

  ªE = 'error';

  ªF = 'function';

  ªN = 'number';

  ªO = 'object';

  ªR = 'regexp';

  ªS = 'string';

  ªU = 'undefined';

  ªX = 'null';

  ª = console.log.bind(console);

  ªex = function(x, a, b) {
    var pos;
    if (-1 === (pos = a.indexOf(x))) {
      return x;
    } else {
      return b.charAt(pos);
    }
  };

  ªhas = function(h, n, t, f) {
    if (t == null) {
      t = true;
    }
    if (f == null) {
      f = false;
    }
    if (-1 !== h.indexOf(n)) {
      return t;
    } else {
      return f;
    }
  };

  ªtype = function(x) {
    return {}.toString.call(x).match(/\s([a-z|A-Z]+)/)[1].toLowerCase();
  };

  ªuid = function(p) {
    return p + '_' + (Math.random() + '1111111111111111').slice(2, 18);
  };

  ªredefine = function(obj, name, value, kind) {
    switch (kind) {
      case 'constant':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: true
        });
      case 'private':
        return Object.defineProperty(obj, name, {
          value: value,
          enumerable: false
        });
    }
  };

  BaseRuntime = (function() {
    BaseRuntime.prototype.C = 'BaseRuntime';

    BaseRuntime.prototype.toString = function() {
      return "[object " + this.C + "]";
    };

    function BaseRuntime(config) {
      if (ªO !== ªtype(config)) {
        throw new Error(this.C + ": `config` must be type 'object'");
      }
      this.xx = 'xx';
    }

    BaseRuntime.prototype.init = function(xx) {};

    return BaseRuntime;

  })();

  ClientRuntime = (function(superClass) {
    extend(ClientRuntime, superClass);

    ClientRuntime.prototype.C = 'ClientRuntime';

    function ClientRuntime(config) {
      ClientRuntime.__super__.constructor.call(this, config);
      this.env = config.env;
      if (ªS !== ªtype(this.env)) {
        throw new Error(this.C + ": `config.env` must be type 'string'");
      }
      if (!/^client$/.test(this.env)) {
        throw new Error(this.C + ": `config.env` must be 'client'");
      }
      this.wsc = null;
      this.xx = 'xx';
    }

    ClientRuntime.prototype.start = function() {
      this.wsc = new WebSocket('ws://127.0.0.1:8080');
      this.wsc.onopen = (function(_this) {
        return function(evt) {
          ª('CONNECTED');
          return _this.wsc.send('123 Testing');
        };
      })(this);
      this.wsc.onclose = function(evt) {
        return ª('DISCONNECTED');
      };
      this.wsc.onmessage = function(evt) {
        return ª('RECEIVED: ' + evt.data);
      };
      return this.wsc.onerror = function(evt) {
        return ª('ERROR: ', evt);
      };
    };

    ClientRuntime.prototype.stop = function() {
      this.wsc.close();
      return this.wsc = null;
    };

    ClientRuntime.prototype.init = function(xx) {};

    return ClientRuntime;

  })(BaseRuntime);

  Main = (function() {
    Main.prototype.C = ªC;

    Main.prototype.toString = function() {
      return "[object " + this.C + "]";
    };

    function Main(config) {
      if (ªO !== ªtype(config)) {
        throw new Error(this.C + ": `config` must be type 'object'");
      }
      this.env = config.env;
      if (ªS !== ªtype(this.env)) {
        throw new Error(this.C + ": `config.env` must be type 'string'");
      }
      if (!/^client|server$/.test(this.env)) {
        throw new Error(this.C + ": `config.env` must be 'client' or 'server'");
      }
      if ('client' === this.env) {
        this.runtime = new ClientRuntime(config);
      } else {
        this.runtime = new ServerRuntime(config);
      }
    }

    Main.prototype.start = function() {
      return this.runtime.start();
    };

    Main.prototype.stop = function() {
      return this.runtime.stop();
    };

    Main.prototype.init = function(xx) {};

    return Main;

  })();

  ServerRuntime = (function(superClass) {
    extend(ServerRuntime, superClass);

    ServerRuntime.prototype.C = 'ServerRuntime';

    function ServerRuntime(config) {
      this.checkDir = bind(this.checkDir, this);
      var dirRx, ref;
      ServerRuntime.__super__.constructor.call(this, config);
      this.env = config.env;
      if (ªS !== ªtype(this.env)) {
        throw new Error(this.C + ": `config.env` must be type 'string'");
      }
      if (!/^server$/.test(this.env)) {
        throw new Error(this.C + ": `config.env` must be 'server'");
      }
      this.wss = config.wss;
      if (ªF !== ªtype(this.wss)) {
        throw new Error(this.C + ": `config.wss` must be type 'function'");
      }
      this.wsServer = null;
      this.fs = config.fs;
      if (ªO !== ªtype(this.fs)) {
        throw new Error(this.C + ": `config.fs` must be type 'object'");
      }
      this.dir = config.dir;
      if (ªS !== ªtype(this.dir)) {
        throw new Error(this.C + ": `config.dir` must be type 'string'");
      }
      dirRx = /^[-\/_.A-Za-z0-9]{1,128}$/;
      if (!dirRx.test(this.dir)) {
        throw new Error(this.C + ": `config.dir` fails " + dirRx);
      }
      if (!this.fs.existsSync(this.dir)) {
        throw new Error(this.C + ": `config.dir` does not exist");
      }
      this.wait = config.wait;
      if (ªN !== ªtype(this.wait)) {
        throw new Error(this.C + ": `config.wait` must be type 'number'");
      }
      if (!((100 <= (ref = this.wait) && ref <= 1000 * 60 * 60))) {
        throw new Error(this.C + ": `config.wait` must be 100-" + (1000 * 60 * 60));
      }
      this.stats = this.fs.statSync(this.dir);
      if (!this.stats.isDirectory()) {
        throw new Error(this.C + ": `config.dir` is not a directory");
      }
      this.watcher = null;
      this.files = this.fs.readdirSync(this.dir);
      this.clients = [];
      this.xx = 'x';
    }

    ServerRuntime.prototype.qq = function(xx) {};

    ServerRuntime.prototype.start = function() {
      this.watcher = setInterval(this.checkDir, this.wait);
      this.wsServer = new this.wss({
        port: 8080
      });
      return this.wsServer.on('connection', function(ws) {
        ª('connected');
        ws.send('thanks for connecting');
        return ws.on('message', function(message) {
          ª('recieved', message);
          return ws.send('thanks for "' + message + '"');
        });
      });
    };

    ServerRuntime.prototype.stop = function() {
      return clearInterval(this.watcher);
    };

    ServerRuntime.prototype.checkDir = function() {
      var added, file, fileNow, filesNow, i, j, len, len1, ref, removed;
      filesNow = this.fs.readdirSync(this.dir);
      removed = false;
      ref = this.files;
      for (i = 0, len = ref.length; i < len; i++) {
        file = ref[i];
        if (-1 === filesNow.indexOf(file)) {
          removed = true;
          break;
        }
      }
      added = false;
      for (j = 0, len1 = filesNow.length; j < len1; j++) {
        fileNow = filesNow[j];
        if (-1 === this.files.indexOf(fileNow)) {
          added = true;
          break;
        }
      }
      if (removed || added) {
        ª("Files have changed");
        return this.files = filesNow;
      }
    };

    ServerRuntime.prototype.onDirChange = function(evt, filename) {
      return ª(evt, filename);
    };

    return ServerRuntime;

  })(BaseRuntime);

  if (ªF === typeof define && define.amd) {
    define(function() {
      return Main;
    });
  } else if (ªO === typeof module && module && module.exports) {
    module.exports = Main;
  } else {
    this[ªC] = Main;
  }

}).call(this);
