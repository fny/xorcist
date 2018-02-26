require 'xorcist'

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

LEN  = 16
ZERO = ([0x00].pack('C') * LEN).freeze
ONE  = ([0xFF].pack('C') * LEN).freeze
X    = (0...LEN).collect { rand 256 }.pack('C*').freeze
INVX = (0...LEN).collect { |i| X[i].ord ^ 0xFF }.pack('C*').freeze

def frozen_strings_dependent
  if ''.frozen? # Strings are frozen by default
    assert_raises(RuntimeError) { yield }
  else
    yield
  end
end
