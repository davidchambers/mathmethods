(function (Object, Math) {

  function defineProperty(name) {
    var
      method = Math[name],
      random = name == "random",
      invoke = !/^(atan2|max|min|pow)$/.test(name)

    Object.defineProperty(Number.prototype, name, {
      get: function () {
        var self = this
        return random ? this * method() : invoke ? method(this) : function () {
          var args = Array.prototype.slice.call(arguments)
          args.unshift(self)
          return method.apply(Math, args)
        }
      }
    })
  }

  var
    names = Object.getOwnPropertyNames(Math),
    i = names.length

  while (i--) {
    if (typeof Math[names[i]] == "function") {
      defineProperty(names[i])
    }
  }

}(Object, Math));
