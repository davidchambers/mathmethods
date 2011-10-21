{defineProperty} = Object
unless defineProperty?
  defineProperty = (object, name, descriptor) ->
    object.__defineGetter__ name, descriptor.get

addGetter = (name, fn) ->
  get = if name is 'random' then -> this * fn() else -> fn this
  defineProperty Number.prototype, name, {get}

addMethod = (name, fn) ->
  Number::[name] = (args...) -> fn.apply Math, [this].concat args

getters = [
  'abs'
  'acos'
  'asin'
  'atan'
  'ceil'
  'cos'
  'exp'
  'floor'
  'log'
  'random'
  'round'
  'sin'
  'sqrt'
  'tan'
]

methods = [
  'atan2'
  'max'
  'min'
  'pow'
]

for name in getters
  addGetter name, fn if typeof (fn = Math[name]) is 'function'

for name in methods
  addMethod name, fn if typeof (fn = Math[name]) is 'function'
