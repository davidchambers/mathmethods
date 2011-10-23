# mathmethods

mathmethods is a tiny script which makes methods of the [`Math`][1] object
available to numbers by adding properties to `Number.prototype`. This makes it
possible to write certain expressions in a more expressive (Ruby-like) manner.

For each `Math` method, a property is added to `Number.prototype`. Accessing
one of these properties invokes the appropriate method with the number as the
first argument. The majority of the `Math` methods take exactly one argument,
so parentheses are not required.

```javascript
// with mathmethods                       // without

dollars = balance.floor                   dollars = Math.floor(balance)

width = $nav.offset().left.abs            width = Math.abs($nav.offset().left)

Infinity.atan.log.sqrt                    Math.sqrt(Math.log(Math.atan(Infinity)))
```

A few `Math` methods – `atan2`, `max`, `min`, and `pow` – take more than one
argument. When a property corresponding to one of these methods is accessed,
a callable is returned which accepts the remaining arguments.

```javascript
// with mathmethods                       // without

x.pow(y)                                  Math.pow(x, y)

fee = 0..max(rate * hours - advance)      fee = Math.max(0, rate * hours - advance)

kim.wage = 10..min(ian.wage, jan.wage)    kim.wage = Math.min(10, ian.wage, jan.wage)
```

### `random`

[`Math.random`][2] takes *zero* arguments. For consistency with the other
methods, `Number.prototype.random` produces a number between 0 and `this`.
`100..random`, for example, produces a number between 0 and 100.

```javascript
// generate a number between 0 and 1 (inclusive of 0, exclusive of 1)

1..random                                 Math.random()

// simluate a die roll

6..random.floor + 1                       Math.floor(6 * Math.random()) + 1
```

### `squared` and `cubed`

Shorthands for the equivalent `.pow`s.

```javascript
// with mathmethods                       // without

area = width.squared                      area = Math.pow(width, 2)

volume = x.cubed                          volume = Math.pow(x, 3)
```

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

### Cautionary note

There are lots of reasons not to use this code: [`Object.defineProperty`][3]
is not universally supported, using "getters" in JavaScript is not idiomatic,
and code written in this fashion is somewhat more difficult to comprehend.


[1]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math
[2]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math/random
[3]: https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Object/defineProperty
