# Xorcist :ghost:

[![Gem Version](https://badge.fury.io/rb/xorcist.svg)](http://badge.fury.io/rb/xorcist)
[![Build Status](https://travis-ci.org/fny/xorcist.svg?branch=master)](https://travis-ci.org/fny/xorcist)

Blazing-fast-cross-platform-monkey-patch-free string XOR. Yes, that means JRuby too.

## Usage

```ruby
require 'xorcist'

a, b = 'a', 'b'
Xorcist.xor(a, b) # => "\u0003"
a # => 'a'
Xorcist.xor!(a, b) # => "\u0003"
a # => "\u0003"
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

You can also monkey patch `String` if you're into that:

```ruby
require 'xorcist'
require 'xorcist/string_methods'
String.include(Xorcist::StringMethods)
```

## Encodings

Note the precise encoding `xor`'s output is undefined in the v1.0.x releases. In MRI `xor!` will return a string using your default encoding. With JRuby, `xor!` will return an ASCII-8BIT string.

## Benchmarks

Disclaimer: these are run from my craptop. Run 'em yourself with `bin/benchmark`. You'll need to have [`benchmark-ips`](https://github.com/evanphx/benchmark-ips) installed.

### MRI 2.2.1

```
Calculating -------------------------------------
                ruby    26.378k i/100ms
             xorcist    73.291k i/100ms
-------------------------------------------------
                ruby    376.513k (± 0.5%) i/s -      1.899M
             xorcist      2.150M (± 3.9%) i/s -     10.774M
```

### JRuby 1.7.19

```
Picked up JAVA_TOOL_OPTIONS: -javaagent:/usr/share/java/jayatanaag.jar 
Calculating -------------------------------------
                ruby    31.795k i/100ms
             xorcist   118.084k i/100ms
-------------------------------------------------
                ruby    978.078k (±11.2%) i/s -      4.801M
             xorcist      3.897M (±14.1%) i/s -     19.012M
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

Bug reports and pull requests are welcome on GitHub at https://github.com/fny/xorcist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Special Thanks To...

 - [Steve Sloan](http://www.finagle.org) for his [fast_xor gem](https://github.com/CodeMonkeySteve/fast_xor) from which most of the tests are borrowed
 - [James Coglan](http://jcoglan.com) for his [guide on writing a JRuby Java extension](https://blog.jcoglan.com/2012/08/02/your-first-ruby-native-extension-java/)
 - [Thomas Leitner](https://github.com/gettalong) for a faster pure Ruby XOR implementation that's used in the benchmark
 - To all [contributers](https://github.com/fny/xorcist/graphs/contributors)! :beers:

