require 'test_helper'

if RUBY_ENGINE != 'jruby' && RUBY_ENGINE != 'rbx' && RUBY_VERSION >= '2.0.0'
  require 'xorcist/refinements'

  class RefinementsTest < Minitest::Test
    using Xorcist::Refinements

    def test_xor
      assert_equal ZERO, X.xor(X)
      assert_equal ONE,  X.xor(INVX)
      assert_equal X,    X.xor(ZERO)
      assert_equal INVX, X.xor(ONE)
    end

    def test_xor_in_place
      a = "String"
      b = a
      b.xor!(X)
      assert_equal(a, b)
    end
  end
end
