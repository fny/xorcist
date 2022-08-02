package org.xorcist.jruby;

import org.jruby.anno.JRubyMethod;
import org.jruby.runtime.ThreadContext;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.RubyString;
import org.jruby.util.ByteList;

public class Xorcist {
    @JRubyMethod(name = "xor!", module = true)
    public static RubyString xorInPlace(ThreadContext context, IRubyObject self, RubyString x, RubyString y) {
        x.modify(); // make sure bytes are not shared with another string
        
        ByteList xBytes = x.getByteList();
        ByteList yBytes = y.getByteList();
        final byte[] xb = xBytes.getUnsafeBytes();
        final byte[] yb = yBytes.getUnsafeBytes();

        int length = yBytes.getRealSize() < xBytes.getRealSize() ? yBytes.getRealSize() : xBytes.getRealSize();
        final int xoff = xBytes.getBegin();
        final int yoff = yBytes.getBegin();

        for (int xi = xoff; xi < xoff + length; xi++) {
            xb[xi] = (byte) (xb[xi] ^ yb[yoff + xi - xoff]);
        }
        xBytes.setRealSize(length);

        return x;
    }
}
