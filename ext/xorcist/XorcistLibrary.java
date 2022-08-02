package org.xorcist.jruby;

import org.jruby.Ruby;
import org.jruby.RubyModule;
import org.jruby.runtime.load.Library;

public class XorcistLibrary implements Library {
    public void load(Ruby runtime, boolean wrap) {
        RubyModule xorcist = runtime.defineModule("Xorcist");
        xorcist.defineAnnotatedMethods(Xorcist.class);
    }
}
