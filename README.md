# mathmethods

    npm install mathmethods

mathmethods is a tiny script which makes methods of the [`Math`][1] object
available to numbers by adding properties to `Number.prototype`. This makes it
possible to write certain expressions in a more expressive (Ruby-like) manner.

For each `Math` method, a property is added to `Number.prototype`. Accessing
one of these properties invokes the appropriate method with the number as the
first argument. The majority of the `Math` methods take exactly one argument,
so parentheses are not required.

```javascript
dollars = balance.floor                   // dollars = Math.floor(balance)

width = $nav.offset().left.abs            // width = Math.abs($nav.offset().left)

Infinity.atan.log.sqrt                    // Math.sqrt(Math.log(Math.atan(Infinity)))
```

A few `Math` methods – `atan2`, `max`, `min`, and `pow` – take more than one
argument. When a property corresponding to one of these methods is accessed,
a callable is returned which accepts the remaining arguments.

```javascript
x.pow(y)                                  // Math.pow(x, y)

fee = 0..max(rate * hours - advance)      // fee = Math.max(0, rate * hours - advance)

kim.wage = 10..min(ian.wage, jan.wage)    // kim.wage = Math.min(10, ian.wage, jan.wage)
```

### `random`

[`Math.random`][2] takes *zero* arguments. For consistency with the other
methods, `Number.prototype.random` produces a number between 0 and `this`.
`100..random`, for example, produces a number between 0 and 100.

```javascript
1..random                                 // Math.random()

// simluate a die roll
6..random.floor + 1                       // Math.floor(6 * Math.random()) + 1
```

### `squared` and `cubed`

Shorthands for the equivalent `.pow`s.

```javascript
area = width.squared                      // area = Math.pow(width, 2)

volume = x.cubed                          // volume = Math.pow(x, 3)
```

### `fact`

Gives the number's factorial. Throws a RangeError if the number is negative;
a TypeError if the number is not an integer.

```javascript
5..fact                                   // 5 * 4 * 3 * 2 * 1
```

### `radiusToArea`
Gives the area of a circle that has the number as the radius.

```javascript
var circleArea = 12.radiusToArea                    // var circleArea = (Math.pow(12)) * Math.PI
```

### `diameterToCircumference`
Gives the circumference of a circle that has the number is the diameter.

```javascript
var circumference = 12.diameterToCircumference      // var circumference = (Math.PI * 12)
```

### Running the test suite

    make setup
    make test

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### Internet Explorer

There's a [bug in IE9][3] which breaks getters for number primitives which are
integers. To accommodate IE9 one must work with `Number` objects exclusively.

```javascript
dollars = new Number(balance).floor       // dollars = Math.floor(balance)
```

This introduces unacceptable noise. One can quieten it to a certain extent by
defining a function which returns a `Number` object whose value is equivalent
to that of the provided argument.

```javascript
function _(n) { return new Number(n) }

dollars = _(balance).floor                // dollars = Math.floor(balance)

width = _($nav.offset().left).abs         // width = Math.abs($nav.offset().left)

Infinity.atan.log.sqrt                    // Math.sqrt(Math.log(Math.atan(Infinity)))

_(x).pow(y)                               // Math.pow(x, y)

fee = _(0).max(rate * hours - advance)    // fee = Math.max(0, rate * hours - advance)

kim.wage = _(10).min(ian.wage, jan.wage)  // kim.wage = Math.min(10, ian.wage, jan.wage)

_(1).random                               // Math.random()

_(6).random.floor + 1                     // Math.floor(6 * Math.random()) + 1

area = _(width).squared                   // area = Math.pow(width, 2)

volume = _(x).cubed                       // volume = Math.pow(x, 3)
```

A better workaround would be *extremely* gratefully received!


[1]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math
[2]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math/random
[3]: http://stackoverflow.com/questions/7854948
