#! C:/Perl/bin/perl
### Test that the module(s) load!(s)

use Test::More;

use lib '../lib', 'lib';
use Test::And::Output v0.003;
pass( "Test loading the required module(s)" );
done_testing();

