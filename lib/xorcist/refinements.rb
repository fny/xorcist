require 'xorcist/string_methods'

module Xorcist
  module Refinements
    refine String do
      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.1.0")
        import_methods Xorcist::StringMethods
      else
        include Xorcist::StringMethods
      end
    end
  end
end
