import org.jruby.anno.JRubyMethod;
import org.jruby.runtime.ThreadContext;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.RubyString;
import org.jruby.util.ByteList;

public class Xorcist {
    @JRubyMethod(name = "xor!", module = true)
    public static RubyString xorInPlace(ThreadContext context, IRubyObject self, RubyString x, RubyString y) {
        byte[] xBytes = x.getBytes();
        byte[] yBytes = y.getBytes();

        int length = yBytes.length < xBytes.length ? yBytes.length : xBytes.length;

        for(int i = 0; i < length; i++) {
            xBytes[i] = (byte) (xBytes[i] ^ yBytes[i]);
        }

        x.setValue(new ByteList(xBytes, false));
        return x;
    }
}
