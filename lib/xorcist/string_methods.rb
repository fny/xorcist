module Xorcist
  module StringMethods
    def xor(other)
      Xorcist.xor(self, other)
    end

    def xor!(other)
      Xorcist.xor!(self, other)
    end
  end
end
