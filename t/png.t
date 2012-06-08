
# test script for generating png files from Barcode::Code128

# Make sure the module loads correctly - if GD is less than 1.20, skip tests

# Lukas Mueller <lam87@cornell.edu>, June 2012

use strict;

use Test::More tests=>8;
use Barcode::Code128 qw(FNC1);

use_ok("GD");

# some coordinates with known colors
#
my @colors = ( [255, 255, 255], 
	       [0, 0, 0], 
	       [0, 0, 0], 
	       [255, 255, 255], 
	       [255, 255, 255],
	       [0, 0, 0], 
	       [0, 0, 0],
	       
    );

my @pixels = ( [10, 10], 
	       [30, 10], 
	       [30, 20], 
	       [50, 10], 
	       [50, 20],
	       [80, 10],
	       [80, 20],
    );

SKIP: {
    skip "GD version < 1.20 - no png support", 1 unless $GD::VERSION > 1.20;

    my $code = new Barcode::Code128;

    my $test = $code->png("CODE 128");
    
    my $image = GD::Image->newFromPngData($test);

    for (my $i=0; $i<@pixels; $i++) { 
	
	my ($r, $g, $b) = $image->rgb($image->getPixel($pixels[$i]->[0], $pixels[$i]->[1]));
	
	is($r+$g+$b, $colors[$i]->[0]+$colors[$i]->[1]+$colors[$i]->[2], "pixel color test $i");
	
    }
}
    


