require 'xorcist/version'

if RUBY_ENGINE == 'jruby'
  require 'jruby'
  require File.expand_path('../xorcist.jar', __FILE__)
else
  require File.expand_path('../xorcist.so', __FILE__)
end

module Xorcist
  module_function
  def xor(x, y)
    xor!(x.dup, y)
  end
end
