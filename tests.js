// Facilitate quick and dirty testing using Node.js.
if (typeof require != "undefined") require("./mathmethods")

var
  count = 0,
  fails = [],
  assert = function (value) {
    count += 1
    if (!value) fails.push(count)
  },
  assertEqual = function (actual, expected) {
    assert(actual === expected)
  },
  assertNaN = function (value) {
    assert(value !== value)
  }

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

"abs"
   1, assertEqual(10..abs, 10)
   2, assertEqual(10.5.abs, 10.5)
   3, assertEqual((-10).abs, 10)
   4, assertEqual(-10..abs, -10) // don't do this!

"acos"
   5, assertEqual((-1).acos, Math.PI)
   6, assertEqual(1..acos, 0)
   7, assertNaN(2..acos)

"asin"
   8, assertEqual((-1).asin, -Math.PI / 2)
   9, assertEqual(1..asin, Math.PI / 2)
  10, assertNaN(2..asin)

"atan"
  11, assertEqual((-1).atan, Math.atan(-1))
  12, assertEqual(0..atan, 0)
  13, assertEqual(10..atan, Math.atan(10))

"atan2"
  14, assertEqual(0..atan2(0), 0)
  15, assertEqual(Infinity.atan2(0), Math.PI / 2)
  16, assertEqual(Infinity.atan2(Infinity), Math.PI / 4)

"ceil"
  17, assertEqual(Math.PI.ceil, 4)
  18, assertEqual((3 * 0.4).ceil, 2)
  19, assertEqual(-6.9.ceil, -7) // don't do this

"cos"
  20, assertEqual((2 * Math.PI).cos, 1)
  21, assertEqual(Math.PI.cos, -1)

"exp"
  22, assertEqual(1..exp, Math.E)
  23, assertEqual(7.2.exp, Math.exp(7.2))

"floor"
  24, assertEqual(Math.PI.floor, 3)
  25, assertEqual((-4.1).floor, -5)
  26, assertEqual(-4.1.floor, -4) // don't do this!

"log"
  27, assertEqual(10..log, Math.log(10))
  28, assertEqual(0..log, -Infinity)
  29, assertNaN((-1).log)

"max"
  30, assertEqual(0..max(3, -5, 4, -1), 4)
  31, assertEqual((-3.6).max(), -3.6)
  32, assertEqual((-10).max(null), 0)
  33, assertNaN(0..max('foo'))

"min"
  34, assertEqual(0..min(3, -5, 4, -1), -5)
  35, assertEqual((-3.6).min(), -3.6)
  36, assertEqual((-10).min(null), -10)
  37, assertNaN(0..min('foo'))

"pow"
  38, assertEqual(3..pow(4), 81)
  39, assertEqual(1.5.pow(3), 3.375)
  40, assertEqual(Infinity.pow(0), 1)
  41, assertNaN(1..pow(Infinity))

"random"
  42, assert(0..random === 0)
  43, assert(100..random < 100)
  44, assert((-5).random <= 0)

"round"
  45, assertEqual(20.49.round, 20)
  46, assertEqual(20.5.round, 21)
  47, assertEqual((-20.5).round, -20)
  48, assertEqual((-20.51).round, -21)

"sin"
  49, assertEqual((Math.PI / 2).sin, 1)
  50, assertEqual((-100).sin, Math.sin(-100))
  51, assertNaN(Infinity.sin, NaN)

"sqrt"
  52, assertEqual(9..sqrt, 3)
  53, assertEqual(Infinity.sqrt, Infinity)
  54, assertNaN((-10).sqrt)

"tan"
  55, assertEqual(0..tan, 0)
  56, assertEqual(100..tan, Math.tan(100))
  57, assertNaN((-Infinity).tan)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

"squared"
  58, assertEqual(8..squared, 64)
  59, assertEqual(1.5.squared, 2.25)
  60, assertEqual((-7).squared, 49)

"cubed"
  61, assertEqual(3..cubed, 27)
  62, assertEqual((-1.5).cubed, -3.375)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

console.log((count - fails.length) + ' of ' + count + ' tests passed')

if (fails.length) console.log('failed: ' + fails.join(', '))
