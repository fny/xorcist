require 'xorcist/string_methods'

module Xorcist
  module Refinements
    refine String do
      include Xorcist::StringMethods
    end
  end
end
