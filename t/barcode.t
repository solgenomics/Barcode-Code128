# -*- Perl -*-

# Load the module

BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use Barcode::Code128 qw(FNC1);
$loaded = 1;
print "ok 1\n";

# Create a test barcode and make sure it is correct

use strict;
my $code = new Barcode::Code128;
my $encoded = $code->barcode("1234 abcd");
print "not " unless $encoded eq
    ("## #  ###  # ##  ###  #   # ##   # #### ### ## ##  ##  #  # ##    #".
     "  #    ## #    # ##  #    #  ## ###   # ## ##   ### # ##");
print "ok 2\n";
