require 'test_helper'

class XorcistTest < Minitest::Test
  include Xorcist

  def test_xor
    assert_equal ZERO, xor(X, X)
    assert_equal ONE,  xor(X, INVX)
    assert_equal X,    xor(X, ZERO)
    assert_equal INVX, xor(X, ONE)
  end

  def test_xor_in_place
    a = "String"
    b = a
    xor!(b, X)
    assert_equal(a, b)
    refute_equal("String", b)
  end

  #
  # Tests for different string storage behaviors in MRI.
  # See http://patshaughnessy.net/2012/1/4/never-create-ruby-strings-longer-than-23-characters
  # for details.
  # Might as well run them in other Rubies too.
  #

  def test_embedded_string
    a = "Embedded string"
    assert a.size <= 23
    b = a.dup
    xor!(b, X)
    refute_equal(a, b)
  end

  def test_heap_string
    a = "A very long string that's stored on the heap"
    assert a.size > 24
    b = a.dup
    xor!(b, X*2)
    refute_equal(a, b)
  end

  def test_xor_frozen
    a = "An0ther-5tring".freeze
    assert_raises(RuntimeError) { xor!(a, X) }
    b = xor!(a.dup, X)
    assert_equal b, xor(a, X)
  end

end
