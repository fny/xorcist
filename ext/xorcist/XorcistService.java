import java.io.IOException;

import org.jruby.Ruby;
import org.jruby.RubyModule;
import org.jruby.runtime.load.BasicLibraryService;

public class XorcistService implements BasicLibraryService {
    @Override
    public boolean basicLoad(final Ruby runtime) throws IOException {
        RubyModule xorcist = runtime.defineModule("Xorcist");
        xorcist.defineAnnotatedMethods(Xorcist.class);
        return true;
    }
}
