(function (Object, Math, numberProto, slice) {

  function addMethod(name, fn) {
    numberProto[name] = function () {
      return fn.apply(Math, [this].concat(slice.call(arguments)))
    }
  }

  function defineProperty(name, fn) {
    Object.defineProperty(numberProto, name, {
      get: name == "random" ?
        function(){ return this * fn() } :
        function(){ return fn(this) }
    })
  }

  var names = Object.getOwnPropertyNames(Math), idx = names.length

  while (idx--) {
    var name = names[idx], fn = Math[name]
    if (typeof fn == "function") {
      if (/^(atan2|max|min|pow)$/.test(name)) addMethod(name, fn)
      else                                    defineProperty(name, fn)
    }
  }

}(Object, Math, Number.prototype, Array.prototype.slice));
