require 'xorcist/version'

if RUBY_ENGINE == 'jruby'
  require 'jruby'
  require File.expand_path('../xorcist.jar', __FILE__)
else
  require 'xorcist/xorcist'
end

module Xorcist
  module_function
  def xor(x, y)
    xor!(x.dup, y)
  end
end
