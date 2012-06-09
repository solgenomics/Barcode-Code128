# -*- Perl -*-


# Create a test barcode and make sure it is correct

use strict;
use Test::More tests=>2;

use_ok("Barcode::Code128");

my $code = new Barcode::Code128;
my $encoded = $code->barcode("1234 abcd");

is($encoded, "## #  ###  # ##  ###  #   # ##   # #### ### ## ##  ##  #  # ##    #  #    ## #    # ##  #    #  ## ###   # ## ##   ### # ##", "barcode test");

