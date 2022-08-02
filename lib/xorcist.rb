require 'xorcist/version'

if RUBY_ENGINE == 'jruby'
  require 'jruby'
  require 'xorcist.jar'
  if JRuby.respond_to?(:load_ext)
    JRuby::Util.load_ext('fny.xorcist.XorcistLibrary')
  end
else
  require 'xorcist/xorcist'
end

module Xorcist
  module_function
  def xor(x, y)
    xor!(x.dup, y)
  end
end
