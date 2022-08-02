# Xorcist :ghost:

[![Gem Version](https://badge.fury.io/rb/xorcist.svg)](http://badge.fury.io/rb/xorcist)
[![Test](https://github.com/fny/xorcist/actions/workflows/test.yml/badge.svg)](https://github.com/fny/xorcist/actions/workflows/test.yml)

Blazing-fast-cross-platform-monkey-patch-free string XOR. Yes, that means JRuby too.

Supported platforms: MRI (v2+), JRuby (v9.2+), Truffle (v21+), Truffle+GraalVM (v21+).

## Usage

```ruby
require 'xorcist'

a, b = 'a', 'b'
Xorcist.xor(a, b) # => "\u0003"
a # => 'a'
Xorcist.xor!(a, b) # => "\u0003"
a # => "\u0003"
Xorcist.xor!(a.freeze, b) # => RuntimeError!
```

You can `include Xorcist` to expose its methods:

```ruby
require 'xorcist'
include Xorcist

a, b = 'a', 'b'
xor(a, b)
xor!(a, b)
```

Refinements on `String` are also available:

```ruby
require 'xorcist'
require 'xorcist/refinements'
using Xorcist::Refinements

a, b = 'a', 'b'
a.xor(b)
a.xor!(b)
```

Note: Refinements will not work in [JRuby 9.2.6](https://github.com/jruby/jruby/issues/5288) and below. This isn't an issue for earlier versions of JRuby 9.0-9.1 or JRuby 9.2.7+.

You can also monkey patch `String` if you're into that:

```ruby
require 'xorcist'
require 'xorcist/string_methods'
String.include(Xorcist::StringMethods)
```

## Encodings

Note the precise encoding `xor`'s output is undefined in the v1.0-1.x releases. In MRI `xor!` will return a string using your default encoding. With JRuby, `xor!` will return an ASCII-8BIT string.

## Benchmarks

Run from my Macbook. Run 'em yourself with `bin/benchmark`. You'll need to have [`benchmark-ips`](https://github.com/evanphx/benchmark-ips) installed.

### MRI

```
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin21]

Warming up --------------------------------------
                ruby    91.478k i/100ms
             xorcist     1.043M i/100ms
Calculating -------------------------------------
                ruby    928.443k (± 2.0%) i/s -      4.665M in   5.026920s
             xorcist     10.438M (± 1.4%) i/s -     53.187M in   5.096610s
```

### JRuby

```
jruby 9.3.6.0 (2.6.8) 2022-06-27 7a2cbcd376 OpenJDK 64-Bit Server VM 18.0.2+0 on 18.0.2+0 +jit [arm64-darwin]

Warming up --------------------------------------
                ruby   236.487k i/100ms
             xorcist   813.234k i/100ms
Calculating -------------------------------------
                ruby      2.673M (±11.0%) i/s -     13.243M in   5.025536s
             xorcist     20.432M (±24.4%) i/s -     90.269M in   5.000974s
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xorcist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xorcist

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fny/xorcist.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Special Thanks To...

 - [Steve Sloan](http://www.finagle.org) for his [fast_xor gem](https://github.com/CodeMonkeySteve/fast_xor) from which most of the tests are borrowed
 - [James Coglan](http://jcoglan.com) for his [guide on writing a JRuby Java extension](https://blog.jcoglan.com/2012/08/02/your-first-ruby-native-extension-java/)
 - [Thomas Leitner](https://github.com/gettalong) for a faster pure Ruby XOR implementation that's used in the benchmark
 - [The JRuby Team](https://twitter.com/jruby) for their assistance in debugging various issues over the years
 - To all [contributers](https://github.com/fny/xorcist/graphs/contributors)! :beers:
