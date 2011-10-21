(function() {
  var addGetter, addMethod, defineProperty, fn, getters, methods, name, _i, _j, _len, _len2;
  var __slice = Array.prototype.slice;
  defineProperty = Object.defineProperty;
  if (defineProperty == null) {
    defineProperty = function(object, name, descriptor) {
      return object.__defineGetter__(name, descriptor.get);
    };
  }
  addGetter = function(name, fn) {
    var get;
    get = name === 'random' ? function() {
      return this * fn();
    } : function() {
      return fn(this);
    };
    return defineProperty(Number.prototype, name, {
      get: get
    });
  };
  addMethod = function(name, fn) {
    return Number.prototype[name] = function() {
      var args;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return fn.apply(Math, [this].concat(args));
    };
  };
  getters = ['abs', 'acos', 'asin', 'atan', 'ceil', 'cos', 'exp', 'floor', 'log', 'random', 'round', 'sin', 'sqrt', 'tan'];
  methods = ['atan2', 'max', 'min', 'pow'];
  for (_i = 0, _len = getters.length; _i < _len; _i++) {
    name = getters[_i];
    if (typeof (fn = Math[name]) === 'function') {
      addGetter(name, fn);
    }
  }
  for (_j = 0, _len2 = methods.length; _j < _len2; _j++) {
    name = methods[_j];
    if (typeof (fn = Math[name]) === 'function') {
      addMethod(name, fn);
    }
  }
}).call(this);
