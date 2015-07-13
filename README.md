# Xorcist :ghost:

[![Gem Version](https://badge.fury.io/rb/xorcist.svg)](http://badge.fury.io/rb/xorcist)
[![Build Status](https://travis-ci.org/fny/xorcist.svg?branch=master)](https://travis-ci.org/fny/xorcist)

Blazing-fast-cross-platform-monkey-patch-free string XOR. Yes, that means JRuby too.

## Usage

```ruby
require 'xorcist'

a, b = 'a', 'b'
Xorcist.xor(a, b)
Xorcist.xor!(a, b)
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

## Benchmarks

Disclaimer: these are run from my craptop. Run 'em yourself with `bin/benchmark`.

### MRI 2.2.1

```
Calculating -------------------------------------
                ruby    11.136k i/100ms
             xorcist    71.472k i/100ms
-------------------------------------------------
                ruby    144.198k (± 1.3%) i/s -    723.840k
             xorcist      2.155M (± 0.7%) i/s -     10.792M
```

### JRuby 1.7.19

```
Calculating -------------------------------------
                ruby   142.000  i/100ms
             xorcist    88.006k i/100ms
-------------------------------------------------
                ruby      3.113k (±32.6%) i/s -     11.218k in   5.781000s
             xorcist      3.184M (±32.9%) i/s -     12.321M
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
 - To all [contributers](https://github.com/fny/xorcist/graphs/contributors)! :beers:

