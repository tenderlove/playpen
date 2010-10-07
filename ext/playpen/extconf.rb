# :stopdoc:

require 'mkmf'

def asplode(lib)
  abort "-----\n#{lib} is missing."
end

asplode "sandbox"  unless find_header('sandbox.h')
asplode "sandbox"  unless find_library('sandbox', 'sandbox_init')

create_makefile('playpen/playpen')
# :startdoc:
