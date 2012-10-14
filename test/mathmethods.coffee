{Assertion} = require 'should'

require '../src/mathmethods'


Object.defineProperty Assertion.prototype, 'NaN'
  get: ->
    @assert @obj isnt @obj,
      -> "expected #{@inspect} to be NaN"
      -> "expected #{@inspect} not to be NaN"
    this


describe 'mathmethods', ->

  it 'adds "abs" property to Number.prototype', ->
    10.abs.should.equal 10
    10.5.abs.should.equal 10.5
    (-10).abs.should.equal 10
    (-10.abs).should.equal -10 # don't do this!

  it 'adds "acos" property to Number.prototype', ->
    (-1).acos.should.equal Math.PI
    1.acos.should.equal 0
    2.acos.should.be.NaN

  it 'adds "asin" property to Number.prototype', ->
    (-1).asin.should.equal -Math.PI / 2
    1.asin.should.equal Math.PI / 2
    2.asin.should.be.NaN

  it 'adds "atan" property to Number.prototype', ->
    (-1).atan.should.equal Math.atan -1
    0.atan.should.equal 0
    10.atan.should.equal Math.atan 10

  it 'adds "atan2" method to Number.prototype', ->
    0.atan2(0).should.equal 0
    Infinity.atan2(0).should.equal Math.PI / 2
    Infinity.atan2(Infinity).should.equal Math.PI / 4

  it 'adds "ceil" property to Number.prototype', ->
    Math.PI.ceil.should.equal 4
    (3 * 0.4).ceil.should.equal 2
    (-6.9.ceil).should.equal -7 # don't do this!

  it 'adds "cos" property to Number.prototype', ->
    (2 * Math.PI).cos.should.equal 1
    Math.PI.cos.should.equal -1

  it 'adds "exp" property to Number.prototype', ->
    1.exp.should.equal Math.E
    7.2.exp.should.equal Math.exp 7.2

  it 'adds "floor" property to Number.prototype', ->
    Math.PI.floor.should.equal 3
    (-4.1).floor.should.equal -5
    (-4.1.floor).should.equal -4 # don't do this!

  it 'adds "log" property to Number.prototype', ->
    10.log.should.equal Math.log 10
    0.log.should.equal -Infinity
    (-1).log.should.be.NaN

  it 'adds "max" method to Number.prototype', ->
    0.max(3, -5, 4, -1).should.equal 4
    (-3.6).max().should.equal -3.6
    (-10).max(null).should.equal 0
    0.max('foo').should.be.NaN

  it 'adds "min" method to Number.prototype', ->
    0.min(3, -5, 4, -1).should.equal -5
    (-3.6).min().should.equal -3.6
    (-10).min(null).should.equal -10
    0.min('foo').should.be.NaN

  it 'adds "pow" method to Number.prototype', ->
    3.pow(4).should.equal 81
    1.5.pow(3).should.equal 3.375
    Infinity.pow(0).should.equal 1
    1.pow(Infinity).should.be.NaN

  it 'adds "random" property to Number.prototype', ->
    0.random.should.equal 0
    100.random.should.be.below 100
    (-5).random.should.not.be.above 0

  it 'adds "round" property to Number.prototype', ->
    20.49.round.should.equal 20
    20.5.round.should.equal 21
    (-20.5).round.should.equal -20
    (-20.51).round.should.equal -21

  it 'adds "sin" property to Number.prototype', ->
    (Math.PI / 2).sin.should.equal 1
    (-100).sin.should.equal Math.sin -100
    Infinity.sin.should.be.NaN

  it 'adds "sqrt" property to Number.prototype', ->
    9.sqrt.should.equal 3
    Infinity.sqrt.should.equal Infinity
    (-10).sqrt.should.be.NaN

  it 'adds "tan" property to Number.prototype', ->
    0.tan.should.equal 0
    100.tan.should.equal Math.tan 100
    (-Infinity).tan.should.be.NaN

  it 'adds "squared" property to Number.prototype', ->
    8.squared.should.equal 64
    1.5.squared.should.equal 2.25
    (-7).squared.should.equal 49

  it 'adds "cubed" property to Number.prototype', ->
    3.cubed.should.equal 27
    (-1.5).cubed.should.equal -3.375

  it 'adds "fact" property to Number.prototype', ->
    0.fact.should.equal 1
    1.fact.should.equal 1
    5.fact.should.equal 120
    (try (-1).fact catch err then err).should.be.an.instanceof RangeError
    (try 3.75.fact catch err then err).should.be.an.instanceof TypeError
