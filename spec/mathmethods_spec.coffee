require '../mathmethods'

beforeEach ->
  @addMatchers
    to_be: (expected) ->
      # Note: This is only to be used as `expect(expr).to_be NaN`.
      throw new TypeError 'to_be must be passed NaN' if expected is expected
      @message = ->
        "Expected #{@actual} to be NaN."
      @actual isnt @actual
    to_be_less_than: (expected) ->
      @message = ->
        "Expected #{@actual} to be less than #{expected}."
      @actual < expected
    to_be_less_than_or_equal_to: (expected) ->
      @message = ->
        "Expected #{@actual} to be less than or equal to #{expected}."
      @actual <= expected

describe 'mathmethods', ->

  it 'adds "abs" property to Number.prototype', ->
    10.abs.should_be 10
    10.5.abs.should_be 10.5
    (-10).abs.should_be 10
    (-10.abs).should_be -10 # don't do this!

  it 'adds "acos" property to Number.prototype', ->
    (-1).acos.should_be Math.PI
    1.acos.should_be 0
    expect(2.acos).to_be NaN

  it 'adds "asin" property to Number.prototype', ->
    (-1).asin.should_be -Math.PI / 2
    1.asin.should_be Math.PI / 2
    expect(2.asin).to_be NaN

  it 'adds "atan" property to Number.prototype', ->
    (-1).atan.should_be Math.atan -1
    0.atan.should_be 0
    10.atan.should_be Math.atan 10

  it 'adds "atan2" method to Number.prototype', ->
    0.atan2(0).should_be 0
    Infinity.atan2(0).should_be Math.PI / 2
    Infinity.atan2(Infinity).should_be Math.PI / 4

  it 'adds "ceil" property to Number.prototype', ->
    Math.PI.ceil.should_be 4
    (3 * 0.4).ceil.should_be 2
    (-6.9.ceil).should_be -7 # don't do this!

  it 'adds "cos" property to Number.prototype', ->
    (2 * Math.PI).cos.should_be 1
    Math.PI.cos.should_be -1

  it 'adds "exp" property to Number.prototype', ->
    1.exp.should_be Math.E
    7.2.exp.should_be Math.exp 7.2

  it 'adds "floor" property to Number.prototype', ->
    Math.PI.floor.should_be 3
    (-4.1).floor.should_be -5
    (-4.1.floor).should_be -4 # don't do this!

  it 'adds "log" property to Number.prototype', ->
    10.log.should_be Math.log 10
    0.log.should_be -Infinity
    expect((-1).log).to_be NaN

  it 'adds "max" method to Number.prototype', ->
    0.max(3, -5, 4, -1).should_be 4
    (-3.6).max().should_be -3.6
    (-10).max(null).should_be 0
    expect(0.max 'foo').to_be NaN

  it 'adds "min" method to Number.prototype', ->
    0.min(3, -5, 4, -1).should_be -5
    (-3.6).min().should_be -3.6
    (-10).min(null).should_be -10
    expect(0.min 'foo').to_be NaN

  it 'adds "pow" method to Number.prototype', ->
    3.pow(4).should_be 81
    1.5.pow(3).should_be 3.375
    Infinity.pow(0).should_be 1
    expect(1.pow Infinity).to_be NaN

  it 'adds "random" property to Number.prototype', ->
    0.random.should_be 0
    expect(100.random).to_be_less_than 100
    expect((-5).random).to_be_less_than_or_equal_to 0

  it 'adds "round" property to Number.prototype', ->
    20.49.round.should_be 20
    20.5.round.should_be 21
    (-20.5).round.should_be -20
    (-20.51).round.should_be -21

  it 'adds "sin" property to Number.prototype', ->
    (Math.PI / 2).sin.should_be 1
    (-100).sin.should_be Math.sin -100
    expect(Infinity.sin).to_be NaN

  it 'adds "sqrt" property to Number.prototype', ->
    9.sqrt.should_be 3
    Infinity.sqrt.should_be Infinity
    expect((-10).sqrt).to_be NaN

  it 'adds "tan" property to Number.prototype', ->
    0.tan.should_be 0
    100.tan.should_be Math.tan 100
    expect((-Infinity).tan).to_be NaN

  it 'adds "squared" property to Number.prototype', ->
    8.squared.should_be 64
    1.5.squared.should_be 2.25
    (-7).squared.should_be 49

  it 'adds "cubed" property to Number.prototype', ->
    3.cubed.should_be 27
    (-1.5).cubed.should_be -3.375
