
# test script for generating png files from Barcode::Code128

# Make sure the module loads correctly - if GD is less than 1.20, skip tests

# Lukas Mueller <lam87@cornell.edu>, June 2012

use strict;

use Test::More tests=>2;
use Barcode::Code128 qw(FNC1);

use_ok("GD");

SKIP: {
    skip "GD version < 1.20 - no png support", 1 unless $GD::VERSION > 1.20;

    my $code = new Barcode::Code128;
    my $file = "t/code128.png";
    my $good;
    {
	open IM, $file or die "Can't read $file: $!";
	binmode IM;
	read IM, $good, -s $file;
	close IM;
    }

    my $test = $code->png("CODE 128");
    
    is($test, $good, "png comparison test");
}
    


